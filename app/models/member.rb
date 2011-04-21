class Member < ActiveRecord::Base
  has_many :addresses, :as => :addressable
  has_many :telephones, :as => :telephonable
  has_many :emails, :as => :emailable
  
  validates_presence_of :first_name, :last_name, :membership_number
  
  def full_name(options = {})
    opts = options.reverse_merge(:middle_name => false, :last_first => false)
    f_name = if opts[:middle_name] && self.middle_name?
      "#{first_name} #{middle_name}"
    else
      first_name
    end
    
    if opts[:last_first]
      "#{last_name}, #{f_name}"
    else
      "#{f_name} #{last_name}"
    end
  end
end
