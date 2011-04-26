class Rank < ActiveRecord::Base
  validates_presence_of   :number
  validates_presence_of   :color
  validates_length_of     :color, :maximum => 6
  validates_presence_of   :description
  validates_length_of     :description, :maximum => 20
  validates_inclusion_of  :letter, :in => 'A'..'C', :if => Proc.new{|r| !r.letter.blank?}
  
  scope :rank_order, order('number DESC, letter ASC')
  
  def type_name
    self.class.to_s.sub('Rank', '')
  end
  
  # Delegate allowed colors to one's class
  def allowed_colors
    self.class.allowed_colors
  end
end
