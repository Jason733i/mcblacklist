class CreateOffenders < ActiveRecord::Migration
  def self.up
    create_table :offenders do |t|
      t.string :username
      t.integer :risk, default: 0, allow_nil: false

      t.timestamps
    end
  end

  def self.down
    drop_table :offenders
  end
end
