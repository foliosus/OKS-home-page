require 'test_helper'

class AddressTest < ActiveSupport::TestCase
  should validate_presence_of :addressable_id
  should validate_presence_of :addressable_type
  should validate_presence_of :address_type
  should validate_presence_of :address
  should validate_presence_of :city
  should validate_presence_of :state
  should validate_presence_of :zip
  
  should belong_to :addressable
  
  should ensure_length_of(:addressable_type).is_at_most(20)
  should ensure_length_of(:address_type).is_at_most(5)
  should ensure_length_of(:address).is_at_most(60)
  should ensure_length_of(:address2).is_at_most(60)
  should ensure_length_of(:city).is_at_most(40)
  should ensure_length_of(:state).is_at_most(2)
  should ensure_length_of(:zip).is_at_most(9)
  
  
  (US_STATES + CANADA_STATES).each do |state|
    should "validate #{state.first} as a state" do
      a = Address.new(:state => state.last)
      a.valid?
      assert a.errors[:state].blank?, a.errors.full_messages.inspect
    end
  end
  
  [nil, '', 'XZ'].each do |code|
    should "not validate #{code.inspect} as a state" do
      a = Address.new(:state => code)
      a.valid?
      assert a.errors[:state].any?, a.errors.full_messages.inspect
    end
    
    should "not validate #{code.inspect} as an address type" do
      a = Address.new(:address_type => code)
      a.valid?
      assert a.errors[:address_type].any?, a.errors.full_messages.inspect
    end
  end
  
  ADDRESS_TYPES.each do |atype|
    should "validate #{atype} as an address type" do
      a = Address.new(:address_type => atype)
      a.valid?
      assert a.errors[:address_type].blank?, a.errors.full_messages.inspect
    end
  end
end
