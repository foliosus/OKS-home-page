require 'test_helper'

class AikidoRankTest < ActiveSupport::TestCase
  %W(white yellow orange blue purple brown black).each do |color|
    should allow_value(color).for(:color)
  end
  %w(green red maroon violet).each do |color|
    should_not allow_value(color).for(:color)
  end
  
  should "know its allowed colors" do
    assert_equal AikidoRank::ALLOWED_COLORS, AikidoRank.allowed_colors
  end
end
