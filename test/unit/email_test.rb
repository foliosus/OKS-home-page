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
  
  should allow_value('a@b.com').for(:address)
  should_not allow_value('a').for(:address)
  should_not allow_value(nil).for(:address)
end
