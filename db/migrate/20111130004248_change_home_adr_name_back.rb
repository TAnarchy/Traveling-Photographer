class ChangeHomeAdrNameBack < ActiveRecord::Migration
  def change
		change_table :constants do |t|
			t.rename :HomeAddress, :home_address
		end
	end
end
