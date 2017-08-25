class Teacher < ApplicationRecord
  
  belongs_to :department
  belongs_to :user, optional: true
  belongs_to :block, optional: true
  has_many :teaching_loads
  has_many :subjects, :through => :teaching_loads
  has_many :sections
  has_many :activities
  has_many :grades
  
  validates :user_id, uniqueness: true
  validates :department, presence: true
  validates_uniqueness_of :block, :allow_blank => true

  def id_with_name
    str = self.id.to_s
    str += "  #{self.user.first_name} #{self.user.last_name} #{self.department.name}" if self.user.present?
    str
  end
  
  def nil_block
    name = self.block_id.presence || "None"
  end
end
