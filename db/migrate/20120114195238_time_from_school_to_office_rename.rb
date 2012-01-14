class TimeFromSchoolToOfficeRename < ActiveRecord::Migration
  def up
    rename_column :travel_data, :TimeFromSchoolToOffice, :time_from_school_to_office
  end

  def down
  end
end
