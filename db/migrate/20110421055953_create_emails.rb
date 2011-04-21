class CreateEmails < ActiveRecord::Migration
  def self.up
    create_table :emails do |t|
      t.integer :emailable_id, :null => false
      t.string :emailable_type, :limit => 20, :null => false
      t.string :email_type, :limit => 5, :null => false, :default => 'home'
      t.boolean :current, :default => true
      t.string :address, :limit => 80, :null => false

      t.timestamps
    end
  end

  def self.down
    drop_table :emails
  end
end
