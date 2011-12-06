class FixBadDataInTime < ActiveRecord::Migration
  def up
  	  execute << -SQL 
  	  UPDATE TABLE travel_data SET TravelTime=0
  	  SQL
  end

  def down
  	  execute << -SQL 
  	  UPDATE TABLE travel_data SET TravelTime=5
  	  SQL
  end
end
