require 'test_helper'

class KiRankTest < ActiveSupport::TestCase
  %W(white black).each do |color|
    should allow_value(color).for(:color)
  end
  %w(green red maroon violet yellow orange blue purple brown).each do |color|
    should_not allow_value(color).for(:color)
  end
  
  should "know its allowed colors" do
    assert_equal KiRank::ALLOWED_COLORS, KiRank.allowed_colors
  end
end
