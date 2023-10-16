class GroupChat < ApplicationRecord
  belongs_to :user
  belongs_to :group_room
  
   validates :message, presence: true, length: { maximum: 140 }
end
