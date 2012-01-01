require 'MyWeb'
class TravelDatum < ActiveRecord::Base
	before_save :caclFormulaFields
	validates :Address, :presence => true
	
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
		 if self.isTravelingToOffice== "Yes"
		 	 mt3 = MyWeb.new(@constant.officeAdr,@constant.home_address)
		 	 dist = mt3.getDistance.split(" ")
		 	 dist2 = dist[0]
		 	stuff = self.gasprice*(self.DistanceFromSchoolToOffice.to_i+self.DistanceFromHome.to_i+dist2.to_i)
		end
		if self.isTravelingToOffice !="Yes"
	 	 	 stuff = self.gasprice*(self.DistanceFromHome.to_i*2)
	 	 end
	 	 
		 self.gastotal= (stuff/@constant.mpg).round(2)
	end
end
