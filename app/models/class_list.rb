class ClassList < ApplicationRecord
  belongs_to :student
  belongs_to :section
  
  validates :student_id, presence: true
  validates :section_id, presence: true
  
  validates_uniqueness_of   :student_id, scope: :section_id
end
