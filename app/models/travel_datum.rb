require 'GoogleMapsWebServicesWrapper'
class TravelDatum < ActiveRecord::Base
  before_save :process_calculated_fields
  validates :address, :presence => true
  validate :address_validation, :travel_path_validation

  def address_validation
    if GoogleMapsWebServicesWrapper.new(TripIndependentInfo.first.home_address,self.address).status== "NOT_FOUND"
      self.errors[:base] << "Address not found"
    end
  end
  
  def travel_path_validation
    if GoogleMapsWebServicesWrapper.new(TripIndependentInfo.first.home_address,self.address).status== "ZERO_RESULTS"
      self.errors[:base] << "Cannot find a travel path between home and school"
    end
  end
  
  def process_calculated_fields
    send_home_request
    set_home_values
    send_school_request
    set_school_values
    traveling_to_office_check
    gas_calculations
  end

  def send_home_request
    @independent = TripIndependentInfo.first
    @home_to_school_wrapper= GoogleMapsWebServicesWrapper.new(@independent.home_address,self.address)
  end

  def set_home_values
    splt= @home_to_school_wrapper.distance.split(" ")
    splt2= @home_to_school_wrapper.duration
    self.distance_from_home=splt[0]
    self.home_to_school_travel_time=splt2
    self.departure=self.start_time-self.home_to_school_travel_time.to_i.minutes-1.hour-40.minutes
  end

  def send_school_request
    @school_to_office_wrapper= GoogleMapsWebServicesWrapper.new(self.address, @independent.office_address)
  end

  def set_school_values
    self.distance_from_school_to_office= @school_to_office_wrapper.distance.split(" ")[0]
    self.time_from_school_to_office= @school_to_office_wrapper.duration
  end

  def traveling_to_office_check
    if self.is_traveling_to_office== "Yes"
      office_to_home_wrapper = GoogleMapsWebServicesWrapper.new(@independent.office_address,@independent.home_address)
      dist = office_to_home_wrapper.distance.split(" ")
      dist2 = dist[0]
      @stuff = self.gas_price*(self.distance_from_school_to_office.to_i+self.distance_from_home.to_i+dist2.to_i)
    end
    if self.is_traveling_to_office !="Yes"
      @stuff = self.gas_price*(self.distance_from_home.to_i*2)
   end
  end

def gas_calculations
   self.total_trip_gas_cost= (@stuff/@independent.mpg).round(2)
   busHours =(self.end_of_business_time.hour-self.departure.hour).to_f
   busMin = ((self.end_of_business_time.min-self.departure.min).abs).to_f
   busMin2 = (busMin/60).to_f
   self.hourly_rate=(125/(busHours+busMin2)).to_f.round(2)
  end
  
  def formatted_home_to_school_travel_time
    formatted_time(self.home_to_school_travel_time)
  end
  
  def formatted_school_to_office_travel_time
    formatted_time(self.time_from_school_to_office)
  end
  
  def formatted_time(time_to_format)
    to_return = time_to_format.divmod(60)[0].to_s
    if time_to_format.divmod(60)[1] < 10
      to_return=to_return+":0" +(time_to_format.divmod(60)[1]).to_s
    else
      to_return=to_return+":"+time_to_format.divmod(60)[1].to_s
    end 
    to_return
  end
  
end
