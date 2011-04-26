class CreateRanks < ActiveRecord::Migration
  def self.up
    create_table :ranks do |t|
      t.integer :number, :default => -10, :null => false
      t.string :letter, :limit => 1
      t.string :color, :limit => 6, :default => 'white', :null => false
      t.string :description, :limit => 20, :default => 'white belt', :null => false
      t.string :type, :limit => 20, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :ranks
  end
end
