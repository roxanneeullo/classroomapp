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
  
  def average_rating(student_id)
    self.class.average(:score).where(:student_id => self.student_id)
  end
end
