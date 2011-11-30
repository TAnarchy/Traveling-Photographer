class RenameHomeAdr < ActiveRecord::Migration
	def change
		change_table :constants do |t|
			t.rename :home_address, :HomeAddress
		end
	end
end
