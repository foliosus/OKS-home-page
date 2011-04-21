require 'test_helper'

class TelephoneTest < ActiveSupport::TestCase
  should validate_presence_of :telephonable_id
  should validate_presence_of :telephonable_type
  should validate_presence_of :telephone_type
  should validate_presence_of :area_code
  should validate_presence_of :number
  
  should belong_to :telephonable
  
  should ensure_length_of(:telephonable_type).is_at_most(20)
  should ensure_length_of(:telephone_type).is_at_most(5)
  
  
  ['1', '12', '1234', 'abc'].each do |area_code|
    should "call #{area_code} an invalid area code" do
      t = Telephone.new(:area_code => area_code)
      t.valid?
      assert t.errors[:area_code].any?, t.errors.full_messages.inspect
    end
  end

  ['123', '456', '789'].each do |area_code|
    should "call #{area_code} a valid area code" do
      t = Telephone.new(:area_code => area_code)
      t.valid?
      assert t.errors[:area_code].blank?, t.errors.full_messages.inspect
    end
  end

  ['1', '12', '1234', 'abc', '123-4567', '123.4567', '12345678'].each do |number|
    should "call #{number} an invalid number" do
      t = Telephone.new(:number => number)
      t.valid?
      assert t.errors[:number].any?, t.errors.full_messages.inspect
    end
  end

  ['1234567', '9876543', '2340155'].each do |number|
    should "call #{number} a valid number" do
      t = Telephone.new(:number => number)
      t.valid?
      assert t.errors[:number].blank?, t.errors.full_messages.inspect
    end
  end
end
