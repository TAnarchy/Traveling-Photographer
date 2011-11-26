class RemoveIdAdr < ActiveRecord::Migration
	def change
		remove_column :constants, :home_address_id
	end
end
