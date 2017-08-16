class Block < ApplicationRecord
  has_one :teacher
  belongs_to :department
  has_many :students
  
  validates :name, presence: true, uniqueness: true
  validates :department_id, presence: true
end
