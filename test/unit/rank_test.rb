require 'test_helper'

class RankTest < ActiveSupport::TestCase
  should have_many :exams
  should have_many :members
  
  should validate_presence_of :number
  should validate_presence_of :color
  should validate_presence_of :description

  should ensure_length_of(:color).is_at_most(6)
  should ensure_length_of(:description).is_at_most(20)
  
  ('A'..'C').each do |letter|
    should allow_value(letter).for(:letter)
  end
  ('D'..'Z').each do |letter|
    should_not allow_value(letter).for(:letter)
  end
  ('a'..'z').each do |letter|
    should_not allow_value(letter).for(:letter)
  end
end
