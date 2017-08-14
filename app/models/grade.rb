class Grade < ApplicationRecord
  belongs_to :student
  belongs_to :teacher
  belongs_to :section
  belongs_to :activity
  
  validates :section_id, presence: true
  validates :teacher_id, presence: true
  validates :student_id, presence: true
  validates :score, presence: true
  validates :activity_id, presence: true
  
  validates_uniqueness_of   :activity_id, scope: :student_id
end
