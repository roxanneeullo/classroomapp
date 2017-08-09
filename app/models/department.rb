class Department < ApplicationRecord
  has_many :courses
  has_many :teachers
  
  validates :name, presence: true, uniqueness: true
end
