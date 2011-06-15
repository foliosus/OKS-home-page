class SplitRanksIntoTwoModels < ActiveRecord::Migration
  def self.up
    drop_table :ranks
    
    create_table :ki_ranks do |t|
      t.integer :number, :default => -10, :null => false
      t.string :color, :limit => 6, :default => 'white', :null => false
      t.string :description, :limit => 20, :default => 'white belt', :null => false
    
      t.timestamps
    end
    
    create_table :aikido_ranks do |t|
      t.integer :number, :default => -10, :null => false
      t.string :letter, :limit => 1
      t.string :color, :limit => 6, :default => 'white', :null => false
      t.string :description, :limit => 20, :default => 'white belt', :null => false
    
      t.timestamps
    end
    
    change_table :exams do |t|
      t.remove :rank_id
      t.remove :created_at
      t.remove :updated_at
      
      t.references :aikido_rank
      t.references :ki_rank
      
      t.timestamps
    end
    
    add_index :exams, :aikido_rank_id
    add_index :exams, :ki_rank_id
    
  end

  def self.down
    raise ActiveRecord::IrreversibleMigration
  end
end
