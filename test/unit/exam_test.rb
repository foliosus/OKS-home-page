require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  should belong_to :member
  should belong_to :rank
  should belong_to :examiner
  
  should validate_presence_of :member_id
  should validate_presence_of :rank_id
  should validate_presence_of :the_date
end
