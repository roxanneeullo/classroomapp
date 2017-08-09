class Course < ApplicationRecord
  
  has_many :students
  belongs_to :department, optional: true
  
  has_many :subjects, :through => :curriculums
  has_many :curriculums
  accepts_nested_attributes_for :curriculums
  
  validates :name, presence: true
end
