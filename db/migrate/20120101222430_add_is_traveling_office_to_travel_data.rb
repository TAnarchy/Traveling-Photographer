class AddIsTravelingOfficeToTravelData < ActiveRecord::Migration
  def change
  	  add_column :travel_data, :isTravelingToOffice, :string
  end
end
