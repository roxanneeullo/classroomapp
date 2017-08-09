class Comment < ApplicationRecord
  
  belongs_to :student
  belongs_to :activity
end
