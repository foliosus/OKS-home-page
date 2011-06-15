class Member < ActiveRecord::Base
  has_many :addresses, :as => :addressable
  has_many :telephones, :as => :telephonable
  has_many :emails, :as => :emailable
  
  has_many :exams, :order => 'the_date DESC', :inverse_of => :member
  has_many :ki_ranks, :through => :exams
  has_many :ki_exams, :class_name => 'Exam', :conditions => 'ki_rank_id IS NOT NULL'
  has_many :aikido_ranks, :through => :exams
  has_many :aikido_exams, :class_name => 'Exam', :conditions => 'aikido_rank_id IS NOT NULL'
  
  # These have to be has_many, because rails doesn't support has_one :through a :has_many
  has_many :current_ki_rank,     :through => :exams, :source => :ki_rank,      :order => 'exams.the_date DESC', :limit => 1
  has_many :current_aikido_rank, :through => :exams, :source => :aikido_rank,  :order => 'exams.the_date DESC', :limit => 1
  
  # Exams this member was the examiner for
  has_many :administered_exams, :class_name => 'Exam', :foreign_key => 'examiner_id'
  
  validates_presence_of :first_name, :last_name, :membership_number
  
  scope :alphabetical_order, order('last_name ASC, first_name ASC, middle_name ASC')
  scope :with_all_exams, includes({:ki_exams => [:ki_rank, :examiner], :aikido_exams => [:aikido_rank, :examiner]})
  scope :with_ki_rank, includes(:current_ki_rank)
  scope :with_aikido_rank, includes(:current_aikido_rank)
  scope :with_current_ranks, with_ki_rank.with_aikido_rank
  
  # The member's current ki rank
  def ki_rank
    @ki_rank ||= if ki_ranks.loaded?
      ki_ranks.sort_by(&:number).last.aikido_rank if ki_ranks.any?
    elsif ki_exams.loaded?
      ki_exams.sort_by(&:the_date).last.ki_rank if ki_exams.any?
    elsif exams.loaded?
      exams.select{|e| e.ki_rank_id? }.sort_by(&:the_date).last.ki_rank if exams.any?
    else
      current_ki_rank.first
    end
  end
  
  # The member's current aikido rank
  def aikido_rank
    @aikido_rank ||= if aikido_ranks.loaded?
      aikido_ranks.sort_by(&:number).last.aikido_rank if aikido_ranks.any?
    elsif aikido_exams.loaded?
      aikido_exams.sort_by(&:the_date).last.aikido_rank if aikido_exams.any?
    elsif exams.loaded?
      exams.select{|e| e.aikido_rank_id? }.sort_by(&:the_date).last.aikido_rank if exams.any?
    else
      current_aikido_rank.first
    end
  end
  
  # The member's full name. Pass in :middle_name => true to get the middle name as well.
  # Pass in :last_first => true to get the last name to come first.
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
