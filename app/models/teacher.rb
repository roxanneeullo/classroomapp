class Teacher < ApplicationRecord
  
  belongs_to :department
  belongs_to :user, optional: true
  belongs_to :block, optional: true
  has_many :teaching_loads
  has_many :subjects, :through => :teaching_loads
  has_many :sections
  has_many :activities
  has_many :grades
  
  validates :user_id, uniqueness: true
  validates :department, presence: true
  validates :block, uniqueness: true
end
