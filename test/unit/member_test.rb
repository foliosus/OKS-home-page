require 'test_helper'

class MemberTest < ActiveSupport::TestCase
  should validate_presence_of :first_name
  should validate_presence_of :last_name
  should validate_presence_of :membership_number

  should have_many :addresses
  should have_many :telephones
  should have_many :emails
  
  should have_many :exams
  should have_many :ranks
  should have_many :administered_exams
  
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
end
