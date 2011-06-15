require 'test_helper'

class ExamTest < ActiveSupport::TestCase
  should belong_to :member
  should belong_to :ki_rank
  should belong_to :aikido_rank
  should belong_to :examiner
  
  should validate_presence_of :member_id
  should validate_presence_of :the_date
  
  context "with ranks" do
    setup do
      @ki_rank = Factory.build :ki_rank
      @aikido_rank = Factory.build :aikido_rank
    end
    
    should "validate presence of one rank" do
      e = Factory.build :exam
      e.valid?
      assert e.errors[:base].any?, "Should have an error on base with no rank"

      e = Factory.build :exam, :aikido_rank => @aikido_rank
      e.valid?
      assert e.errors[:base].blank?, "With an aikido rank, should have no error on base: #{e.errors[:base].inspect}"

      e = Factory.build :exam, :ki_rank => @ki_rank
      e.valid?
      assert e.errors[:base].blank?, "With a ki rank, should have no error on base: #{e.errors[:base].inspect}"

      e = Factory.build :exam, :aikido_rank => @aikido_rank, :ki_rank => @ki_rank
      e.valid?
      assert e.errors[:base].any?, "Should have an error on base with two ranks"
    end

    should "return its associated rank" do
      e = Factory.build :exam
      assert_nil e.rank, "Should have nil when there is no associated rank"

      e = Factory.build :exam, :ki_rank => @ki_rank
      assert_equal @ki_rank, e.rank, "Should return ki rank when present"

      e = Factory.build :exam, :aikido_rank => @aikido_rank
      assert_equal @aikido_rank, e.rank, "Should return aikido rank when present"
    end
  end
end
