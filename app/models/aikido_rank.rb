class AikidoRank < Rank
  ALLOWED_COLORS = %w(white yellow orange blue purple brown black)
  
  validates_inclusion_of  :color, :in => ALLOWED_COLORS

  def self.allowed_colors
    ALLOWED_COLORS
  end
end
