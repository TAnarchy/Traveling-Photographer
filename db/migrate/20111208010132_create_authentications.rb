class CreateAuthentications < ActiveRecord::Migration
  def change
    create_table :authentications do |t|
      t.string :username
      t.string :password

      t.timestamps
    end
  end
end
