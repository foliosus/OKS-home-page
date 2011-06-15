module RanksTestHelper
  def self.included(base)
    base.class_eval do
      should have_many :exams
      should have_many :members

      should validate_presence_of :number
      should validate_presence_of :color
      should validate_presence_of :description

      should ensure_length_of(:color).is_at_most(6)
      should ensure_length_of(:description).is_at_most(20)
    end
  end
end
