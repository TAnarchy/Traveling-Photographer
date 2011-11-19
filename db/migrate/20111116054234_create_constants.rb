class CreateConstants < ActiveRecord::Migration
  def change
    create_table :constants do |t|
      t.integer :SetupTime
      t.integer :mpg

      t.timestamps
    end
  end
end
