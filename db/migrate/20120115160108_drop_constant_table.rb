class DropConstantTable < ActiveRecord::Migration
  def up
    drop_table :constants
  end

  def down
  end
end
