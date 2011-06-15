# Provide shared behaviors for rank classes
module Ranks
  def self.included(base)
    base.class_eval do
      extend ClassMethods
      
      has_many :exams
      has_many :members, :through => :exams

      validates_presence_of   :number
      validates_presence_of   :color
      validates_length_of     :color, :maximum => 6
      validate                :validate_color_inclusion
      validates_presence_of   :description
      validates_length_of     :description, :maximum => 20
    end
  end
  
  # Delegate allowed colors to one's class
  def allowed_colors
    self.class.allowed_colors
  end
  
  def validate_color_inclusion
    errors.add(:color, "must be in #{allowed_colors.join(', ')}") unless allowed_colors.include?(self.color)
  end

  # Compare by number
  def <=>(other)
    self.number <=> other.number
  end
  
  module ClassMethods
    def allowed_colors
      raise "You must implement this in your rank class"
    end
  end
end