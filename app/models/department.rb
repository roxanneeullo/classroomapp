class Department < ApplicationRecord
  has_many :courses
  has_many :teachers
  has_many :students
  
  validates :name, presence: true, uniqueness: true
end
