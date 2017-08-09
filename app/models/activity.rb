class Activity < ApplicationRecord
  belongs_to :teacher
  belongs_to :section
  has_many :grades
  has_many :comments
  
  validates :activity_type, presence: true
  validates :content, presence: true
  validates :section_id, presence: true
  validates :teacher_id, presence: true
end
