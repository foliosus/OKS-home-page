class KiRank < ActiveRecord::Base
  include Ranks
  
  ALLOWED_COLORS = %w(white black)
  
  scope :rank_order, order('number DESC')
  
  # What colors are allowed for Ki ranks?
  def self.allowed_colors
    ALLOWED_COLORS
  end
end
