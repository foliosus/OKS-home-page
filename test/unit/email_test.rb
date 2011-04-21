require 'test_helper'

class EmailTest < ActiveSupport::TestCase
  should validate_presence_of :emailable_id
  should validate_presence_of :emailable_type
  should validate_presence_of :email_type
  should validate_presence_of :address
  
  should belong_to :emailable
  
  should ensure_length_of(:emailable_type).is_at_most(20)
  should ensure_length_of(:email_type).is_at_most(5)
  should ensure_length_of(:address).is_at_most(80)
  
  should "validate emails" do
    e = Email.new(:address => 'a@b.com')
    e.valid?
    assert e.errors[:address].blank?, "Should accept a valid email (#{e.errors.inspect})"

    e.address = 'a'
    e.valid?
    assert e.errors[:address].any?, "Should reject an invalid email (#{e.errors.inspect})"

    e.address = nil
    e.valid?
    assert e.errors[:address].any?, "Should reject a nil email (#{e.errors.inspect})"
  end
end
