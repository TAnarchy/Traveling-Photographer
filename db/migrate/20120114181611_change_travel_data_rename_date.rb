class ChangeTravelDataRenameDate < ActiveRecord::Migration
  def up
    rename_column :travel_data, :Date, :date
  end

  def down
    rename_column :travel_data, :date, :Date
  end
end
