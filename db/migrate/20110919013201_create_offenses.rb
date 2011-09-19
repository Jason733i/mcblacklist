class CreateOffenses < ActiveRecord::Migration
  def self.up
    create_table :offenses do |t|
      t.string :name
      t.text :description
      t.integer :severity
      t.string :type

      t.timestamps
    end
  end

  def self.down
    drop_table :offenses
  end
end
