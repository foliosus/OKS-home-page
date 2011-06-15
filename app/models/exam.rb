class Exam < ActiveRecord::Base
  belongs_to :member
  belongs_to :ki_rank
  belongs_to :aikido_rank
  belongs_to :examiner, :class_name => 'Member'
  
  validates_presence_of :member_id
  validates_presence_of :the_date
  validate              :validate_has_one_rank
  
  # Validate the presence of either a ki rank or an aikido rank
  def validate_has_one_rank
    errors.add(:base, "must have either a Ki rank or an Aikido rank") unless self.ki_rank || self.aikido_rank
    errors.add(:base, "must have only a Ki rank or an Aikido rank, not both") if self.ki_rank && self.aikido_rank
  end
  
  # Return the associated rank
  def rank
    return ki_rank || aikido_rank
  end
end
