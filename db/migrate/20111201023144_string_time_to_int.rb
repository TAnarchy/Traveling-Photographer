class StringTimeToInt < ActiveRecord::Migration
	def change
		remove_column :travel_data, :TravelTime
		remove_column :travel_data, :TimeFromSchoolToOffice
		remove_column :travel_data, :TotalBusinessTime
		add_column :travel_data, :TravelTime, :integer
		add_column :travel_data, :TimeFromSchoolToOffice, :integer 
		add_column :travel_data, :TotalBusinessTime, :integer
	end
end
