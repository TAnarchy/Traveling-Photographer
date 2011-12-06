class AddOfficeAdrToConstant < ActiveRecord::Migration
  def change
  	  add_column :constants, :officeAdr, :string
  end
end
