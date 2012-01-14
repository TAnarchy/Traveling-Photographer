require 'GoogleMapsWebServicesWrapper'
class TravelDatum < ActiveRecord::Base
  before_save :calculate_calculated_fields
  validates :Address, :presence => true
	
  def calculate_calculated_fields
    @constant = Constant.first
    home_to_school_wrapper= GoogleMapsWebServicesWrapper.new(@constant.home_address,self.Address)
    splt= home_to_school_wrapper.distance.split(" ")
    splt2= home_to_school_wrapper.duration
    self.DistanceFromHome=splt[0]
    self.TravelTime=splt2
    self.Departure=self.StartTime-self.TravelTime.to_i.minutes-1.hour-40.minutes
    school_to_office_wrapper= GoogleMapsWebServicesWrapper.new(self.Address, @constant.officeAdr)
    self.DistanceFromSchoolToOffice= school_to_office_wrapper.distance.split(" ")[0]
    self.TimeFromSchoolToOffice= school_to_office_wrapper.duration
    if self.isTravelingToOffice== "Yes"
      office_to_home_wrapper = GoogleMapsWebServicesWrapper.new(@constant.officeAdr,@constant.home_address)
      dist = office_to_home_wrapper.distance.split(" ")
      dist2 = dist[0]
      stuff = self.gasprice*(self.DistanceFromSchoolToOffice.to_i+self.DistanceFromHome.to_i+dist2.to_i)
    end
    if self.isTravelingToOffice !="Yes"
      stuff = self.gasprice*(self.DistanceFromHome.to_i*2)
   end
   self.gastotal= (stuff/@constant.mpg).round(2)
   busHours =(self.EndOfBusiness.hour-self.Departure.hour).to_f
   busMin = ((self.EndOfBusiness.min-self.Departure.min).abs).to_f
   busMin2 = (busMin/60).to_f
   self.HourlyRate=(125/(busHours+busMin2)).to_f.round(2)
  end
end
