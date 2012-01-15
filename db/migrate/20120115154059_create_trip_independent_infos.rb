class CreateTripIndependentInfos < ActiveRecord::Migration
  def change
    create_table :trip_independent_infos do |t|
      t.integer :setup_time
      t.integer :mpg
      t.string :home_address
      t.string :office_address

      t.timestamps
    end
  end
end
