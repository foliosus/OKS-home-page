require 'test_helper'
require 'unit/ranks_test_helper'

class AikidoRankTest < ActiveSupport::TestCase
  include RanksTestHelper
  
  %W(white yellow orange blue purple brown black).each do |color|
    should allow_value(color).for(:color)
  end
  %w(green red maroon violet foo).each do |color|
    should_not allow_value(color).for(:color)
  end
  ('A'..'C').each do |letter|
    should allow_value(letter).for(:letter)
  end
  ('D'..'Z').each do |letter|
    should_not allow_value(letter).for(:letter)
  end
  ('a'..'z').each do |letter|
    should_not allow_value(letter).for(:letter)
  end
  
  should "know its allowed colors" do
    assert_equal AikidoRank::ALLOWED_COLORS, AikidoRank.allowed_colors
    rank = Factory.build(:aikido_rank)
    assert_equal AikidoRank::ALLOWED_COLORS, rank.allowed_colors
  end
end
