class Block < ApplicationRecord
  has_one :teacher
  has_many :students
  
  validates :name, presence: true
end
