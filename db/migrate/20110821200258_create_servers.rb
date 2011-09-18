class CreateServers < ActiveRecord::Migration
  def self.up
    create_table :servers do |t|
      t.integer :user_id, :null => false
      t.string :name, :null => false
      t.string :ip_address, :null => false
      t.string :port, :null => false
      t.timestamps
    end
  end

  def self.down
    drop_table :servers
  end
end
