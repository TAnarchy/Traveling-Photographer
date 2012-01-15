class DropAuthenticationsTable < ActiveRecord::Migration
  def up
    drop_table :Authentications
  end

  def down
  end
end
