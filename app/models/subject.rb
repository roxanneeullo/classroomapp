class Subject < ApplicationRecord
  has_many :curriculums
  has_many :courses, :through => :curriculums
  has_many :teaching_loads
  has_many :teachers, :through => :teaching_loads
  has_many :sections
  #accepts_nested_attributes_for :curriculums
  
  validates :name, presence: true
end
