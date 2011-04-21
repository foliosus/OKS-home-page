class CreateAddresses < ActiveRecord::Migration
  def self.up
    create_table :addresses do |t|
      t.integer :addressable_id, :null => false
      t.string :addressable_type, :limit => 20, :null => false
      t.string :address_type, :limit => 5, :null => false, :default => 'home'
      t.boolean :current, :default => true
      t.string :address, :limit => 60, :null => false
      t.string :address2, :limit => 60
      t.string :city, :limit => 40, :null => false
      t.string :state, :limit => 2, :null => false
      t.string :zip, :limit => 9, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :addresses
  end
end
