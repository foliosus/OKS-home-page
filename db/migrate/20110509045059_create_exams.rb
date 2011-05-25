class CreateExams < ActiveRecord::Migration
  def self.up
    create_table :exams do |t|
      t.integer :member_id, :null => false
      t.integer :rank_id, :null => false
      t.date :the_date, :null => false
      t.integer :examiner_id

      t.timestamps
    end
    
    add_index :exams, :member_id
    add_index :exams, :rank_id
    add_index :exams, :examiner_id
  end

  def self.down
    remove_index :exams, :examiner_id
    remove_index :exams, :rank_id
    remove_index :exams, :member_id
    
    drop_table :exams
  end
end
