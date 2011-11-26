class AddHomeAdr < ActiveRecord::Migration
	def change
		change_table :constants do |t|
			t.string :home_address
		end
	end
end
