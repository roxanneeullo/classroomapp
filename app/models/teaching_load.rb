class TeachingLoad < ApplicationRecord
  belongs_to :teacher
  belongs_to :subject
  
  validates :teacher_id, presence: true
  validates :subject_id, presence: true
end
