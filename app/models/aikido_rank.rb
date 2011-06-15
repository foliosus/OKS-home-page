class AikidoRank < ActiveRecord::Base
  include Ranks
  
  ALLOWED_COLORS = %w(white yellow orange blue purple brown black)
  
  validates_inclusion_of  :letter, :in => 'A'..'C', :if => Proc.new{|r| !r.letter.blank?}
  
  scope :rank_order, order('number DESC, letter ASC')
  
  # What colors are allowed for Aikido ranks
  def self.allowed_colors
    ALLOWED_COLORS
  end
end
