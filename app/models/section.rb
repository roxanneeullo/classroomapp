class Section < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  has_many :students, :through => :class_lists
  has_many :class_lists
  has_many :activities
  has_many :grades
  
  validates :subject_id, presence: true
  validates :teacher_id, presence: true
  validates :name, presence: true
  validates :semester, presence: true
  validates :schedule, presence: true
end
