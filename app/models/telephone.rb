class Telephone < ActiveRecord::Base
  belongs_to :telephonable, :polymorphic => true
  
  validates_presence_of :telephonable_id, :telephonable_type, :telephone_type, :area_code, :number
  validates_inclusion_of :telephone_type, :in => ADDRESS_TYPES, :nil => false
  validates_length_of :telephonable_type, :maximum => 20
  validates_length_of :telephone_type, :maximum => 5
  
  validates_format_of :area_code, :with => /^\d{3}$/, :message => 'must be a 3-digit number'
  validates_format_of :number, :with => /^\d{7}$/, :message => 'must be a 7-digit number'
end
