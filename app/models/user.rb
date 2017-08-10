class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,  :registerable,
         :recoverable, :rememberable, :trackable, :validatable
        
  validates :username, presence: true, uniqueness: true, format: { with: /\A[a-zA-Z0-9]+\Z/ }, length: { maximum: 25 }
  validates :email, presence: true, uniqueness: true, format: { without: /\s/ }, length: { maximum: 30 }
  validates :first_name, presence: true, length: { maximum: 25 }
  validates :last_name, presence: true, length: { maximum: 25 }
  validates :password, length: { maximum: 20 }
  validates :gender, presence: true
  
  has_attached_file :avatar, :styles => { :thumb => "200x200>" }, default_url: "/images/:style/missing.jpg"
  validates_attachment :avatar,
    content_type: { content_type: ["image/jpeg", "image/gif", "image/png"] }
  validates_with AttachmentSizeValidator, attributes: :avatar, less_than: 2.megabytes
  
  has_many :students, dependent: :destroy
  has_many :teachers, dependent: :destroy
  has_many :comments
  
  accepts_nested_attributes_for :students
  accepts_nested_attributes_for :teachers
  accepts_nested_attributes_for :comments
  
  ROLES = %i[admin teacher student]

  def roles=(roles)
    roles = [*roles].map { |r| r.to_sym }
    self.roles_mask = (roles & ROLES).map { |r| 2**ROLES.index(r) }.inject(0, :+)
  end

  def roles
    ROLES.reject do |r|
      ((roles_mask.to_i || 0) & 2**ROLES.index(r)).zero?
    end
  end

  def has_role?(role)
    roles.include?(role)
  end
  
  
end
