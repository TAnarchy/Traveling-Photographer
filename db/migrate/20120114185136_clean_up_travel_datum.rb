class CleanUpTravelDatum < ActiveRecord::Migration
  def up
  	rename_column :travel_data, :Address, :address
  	rename_column :travel_data, :School, :school
  	rename_column :travel_data, :StartTime, :start_time
  	rename_column :travel_data, :DistanceFromHome, :distance_from_home
  	rename_column :travel_data, :Departure, :departure
  	rename_column :travel_data, :DistanceFromSchoolToOffice, :distance_from_school_to_office
  	rename_column :travel_data, :gasprice, :gas_price
  	rename_column :travel_data, :gastotal, :total_trip_gas_cost
  	rename_column :travel_data, :EndOfBusiness, :end_of_business_time
  	rename_column :travel_data, :position, :master_or_assistant
  	rename_column :travel_data, :HourlyRate, :hourly_rate
  	remove_column :travel_data, :BusinessTime
  	rename_column :travel_data, :TravelTime, :home_to_school_travel_time
  	rename_column :travel_data, :TotalBusinessTime, :total_business_time
  	rename_column :travel_data, :departureTime, :departure_time
  	rename_column :travel_data, :isTravelingToOffice, :is_traveling_to_office
  end

  def down
  end
end
