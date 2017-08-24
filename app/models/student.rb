class Student < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :course, optional: true
  belongs_to :block, optional: true
  belongs_to :department, optional: true
  has_many :curriculums
  has_many :sections, :through => :class_lists
  has_many :class_lists
  has_many :grades
  
  validates :user_id, uniqueness: true
  validates :course, presence: true
  validates :year_level, presence: true
  validates :block, presence: true
  
  
  def id_with_name
    str = self.id.to_s
    str += "  #{self.user.first_name} #{self.user.last_name} #{self.department.name}" if self.user.present?
    str
  end
    
    
end

