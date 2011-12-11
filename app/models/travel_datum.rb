require 'MyWeb'
class TravelDatum < ActiveRecord::Base
	before_save :caclFormulaFields
	
	def caclFormulaFields
		@constant = Constant.first
		 mt= MyWeb.new(@constant.home_address,self.Address)
		 splt= mt.getDistance.split(" ")
		 splt2= mt.getDuration
		 self.DistanceFromHome=splt[0]
		 self.TravelTime=splt2
		 self.Departure=self.StartTime-self.TravelTime.to_i.minutes
		 mt2= MyWeb.new(self.Address, @constant.officeAdr)
		 self.DistanceFromSchoolToOffice= mt2.getDistance.split(" ")[0]
		 self.TimeFromSchoolToOffice= mt2.getDuration
		 stuff = self.gasprice*(self.DistanceFromSchoolToOffice+self.DistanceFromHome+31)
		 self.gastotal= (stuff/@constant.mpg).round(2)
	end
end
