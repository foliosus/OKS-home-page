require 'test_helper'
require 'unit/ranks_test_helper'

class KiRankTest < ActiveSupport::TestCase
  include RanksTestHelper
  
  %W(white black).each do |color|
    should allow_value(color).for(:color)
  end
  %w(green red maroon violet yellow orange blue purple brown foo).each do |color|
    should_not allow_value(color).for(:color)
  end
  
  should "know its allowed colors" do
    assert_equal KiRank::ALLOWED_COLORS, KiRank.allowed_colors
    rank = Factory.build(:ki_rank)
    assert_equal KiRank::ALLOWED_COLORS, rank.allowed_colors
  end
end
