class Comment < ApplicationRecord
  
  belongs_to :user
  belongs_to :activity
  
  def as_json(options = {})
    super.merge(created_at: created_at.localtime.strftime('%I:%M%p, %d %b, \'%y'))
  end
end
