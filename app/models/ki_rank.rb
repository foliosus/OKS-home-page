class KiRank < Rank
  ALLOWED_COLORS = %w(white black)
  
  validates_inclusion_of  :color, :in => ALLOWED_COLORS

  def self.allowed_colors
    ALLOWED_COLORS
  end
end
