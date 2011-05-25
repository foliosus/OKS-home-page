class Exam < ActiveRecord::Base
  belongs_to :member
  belongs_to :rank
  belongs_to :examiner, :class_name => 'Member'
  
  validates_presence_of :member_id
  validates_presence_of :rank_id
  validates_presence_of :the_date
end
