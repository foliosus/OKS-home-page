class CreateMembers < ActiveRecord::Migration
  def self.up
    create_table :members do |t|
      t.string :first_name, :limit => 40, :null => false
      t.string :middle_name, :limit => 40
      t.string :last_name, :limit => 40, :null => false
      t.string :membership_number, :limit => 10, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :members
  end
end
