class Curriculum < ApplicationRecord
  belongs_to :subject
  belongs_to :course
  accepts_nested_attributes_for :subject
  
  validates :course, presence: true
  validates :subject, presence: true 
end
