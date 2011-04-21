class Email < ActiveRecord::Base
  belongs_to :emailable, :polymorphic => true
  
  validates_presence_of :emailable_id, :emailable_type, :email_type, :address
  validates_inclusion_of :email_type, :in => ADDRESS_TYPES, :nil => false
  validates_length_of :emailable_type, :maximum => 20
  validates_length_of :email_type, :maximum => 5
  validates_length_of :address, :maximum => 80
  validates_format_of :address, :with => RFC822::EmailAddress
end
