class CreateTelephones < ActiveRecord::Migration
  def self.up
    create_table :telephones do |t|
      t.integer :telephonable_id, :null => false
      t.string :telephonable_type, :limit => 20, :null => false
      t.string :telephone_type, :limit => 5, :null => false
      t.boolean :current, :default => true
      t.string :area_code, :limit => 3, :null => false
      t.string :number, :limit => 7, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :telephones
  end
end
