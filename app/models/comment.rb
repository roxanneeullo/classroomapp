class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :activity
  
  validates :context, presence: true, length: { maximum: 140 }
  validates :user_id, presence: true
  validates :activity_id, presence: true
end
