class Address < ActiveRecord::Base
  belongs_to :addressable, :polymorphic => true
  
  validates_presence_of :addressable_id, :addressable_type, :address_type, :address, :city, :state, :zip
  validates_inclusion_of :address_type, :in => ADDRESS_TYPES, :nil => false
  validates_inclusion_of :state, :in => (US_STATES + CANADA_STATES).collect(&:last), :message => 'must be a US or Canadian state/province'
  validates_length_of :addressable_type, :maximum => 20
  validates_length_of :address_type, :maximum => 5
  validates_length_of :address, :maximum => 60
  validates_length_of :address2, :maximum => 60
  validates_length_of :city, :maximum => 40
  validates_length_of :state, :maximum => 2
  validates_length_of :zip, :maximum => 9
end
