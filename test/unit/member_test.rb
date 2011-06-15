require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  should validate_presence_of :first_name
  should validate_presence_of :last_name
  should validate_presence_of :membership_number

  should have_many :addresses
  should have_many :telephones
  should have_many :emails
  
  should have_many :exams
  should have_many :ki_exams
  should have_many :ki_ranks
  should have_many :aikido_exams
  should have_many :aikido_ranks
  should have_many :administered_exams
  
  should have_many :current_ki_rank
  should have_many :current_aikido_rank
  
  context "with a name" do
    setup do
      @member = Member.new(:first_name => 'John', :middle_name => 'Quincy', :last_name => 'Doe')
    end
    
    should "generate a simple full name" do
      assert_equal 'John Doe', @member.full_name
    end
    
    should "generate a full name with the middle name" do
      assert_equal 'John Quincy Doe', @member.full_name(:middle_name => true)
    end
    
    should "generate a full name, last name first" do
      assert_equal 'Doe, John', @member.full_name(:last_first => true)
    end
    
    should "generate a full name with the middle name, last name first" do
      assert_equal 'Doe, John Quincy', @member.full_name(:last_first => true, :middle_name => true)
    end
  end
  
  context "with aikido ranks" do
    setup do
      @member = Factory.create(:member)
      @aikido_rank_1 = Factory.create(:aikido_rank)
      @aikido_rank_2 = Factory.create(:aikido_rank)
      @aikido_exam_1 = Factory.create(:exam, :member => @member, :aikido_rank => @aikido_rank_1, :the_date => Date.today - 1)
      @aikido_exam_2 = Factory.create(:exam, :member => @member, :aikido_rank => @aikido_rank_2, :the_date => Date.today)
    end
    
    should "load correct current aikido rank" do
      assert_equal @aikido_rank_2, @member.aikido_rank, "Should load correct current aikido rank"
    end
    
    should "pre-load correct current aikido rank" do
      m = Member.with_aikido_rank.find(@member.id)
      assert_equal @aikido_rank_2, m.aikido_rank, "Should preload correct current aikido rank"
    end
    
    context "with ki ranks" do
      setup do
        @ki_rank_1 = Factory.create(:ki_rank)
        @ki_rank_2 = Factory.create(:ki_rank)
        @ki_exam_1 = Factory.create(:exam, :member => @member, :ki_rank => @ki_rank_1, :the_date => Date.today - 1)
        @ki_exam_2 = Factory.create(:exam, :member => @member, :ki_rank => @ki_rank_2, :the_date => Date.today)
      end
      
      should "load correct current ki rank" do
        assert_equal @ki_rank_2, @member.ki_rank, "Should load correct current ki rank"
      end
      
      should "pre-load correct current ki rank" do
        m = Member.with_ki_rank.find(@member.id)
        assert_equal @ki_rank_2, m.ki_rank, "Should preload correct current ki rank"
      end
      
      should "load both current ranks" do
        m = Member.with_current_ranks.find(@member.id)
        assert_equal @aikido_rank_2, m.aikido_rank, "Should preload correct current aikido rank"
        assert_equal @ki_rank_2, m.ki_rank, "Should preload correct current ki rank"
      end
    end
  end
end
