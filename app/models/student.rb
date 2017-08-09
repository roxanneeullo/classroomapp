class Student < ApplicationRecord
  
  belongs_to :user, optional: true
  belongs_to :course, optional: true
  belongs_to :block, optional: true
  has_many :curriculums
  has_many :sections, :through => :class_lists
  has_many :class_lists
  has_many :grades
  
  validates :user_id, uniqueness: true
  validates :course, presence: true
  validates :year_level, presence: true
  validates :block, presence: true
end

