class CreateTravelData < ActiveRecord::Migration
  def change
    create_table :travel_data do |t|
      t.date :Date
      t.string :Address
      t.string :School
      t.time :StartTime
      t.integer :DistanceFromHome
      t.string :TravelTime
      t.time :Departure
      t.integer :DistanceFromSchoolToOffice
      t.string :TimeFromSchoolToOffice
      t.decimal :gasprice
      t.decimal :gastotal
      t.time :EndOfBusiness
      t.string :position
      t.string :TotalBusinessTime
      t.decimal :HourlyRate
      t.string :BusinessTime

      t.timestamps
    end
  end
end
