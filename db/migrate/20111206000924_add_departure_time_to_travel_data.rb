class AddDepartureTimeToTravelData < ActiveRecord::Migration
  def change
	add_column :travel_data, :departureTime, :time
  end
end
