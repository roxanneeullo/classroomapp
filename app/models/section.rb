class Section < ApplicationRecord
  belongs_to :subject
  belongs_to :teacher
  has_many :students, :through => :class_lists
  has_many :class_lists
  has_many :activities
  has_many :grades
  
  validates :subject_id, presence: true
  validates :teacher_id, presence: true
  validates :name, presence: true, uniqueness: true
  validates :semester, presence: true
  validates :schedule, presence: true, uniqueness: true
  
  validates_uniqueness_of   :subject_id, scope: :teacher_id
end
