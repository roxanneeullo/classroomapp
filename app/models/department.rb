class Department < ApplicationRecord
  has_many :courses
  has_many :teachers
  has_many :students
  has_many :blocks
  
  validates :name, presence: true, uniqueness: true
end
