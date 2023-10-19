class GroupChat < ApplicationRecord
  belongs_to :user
  belongs_to :group_room
  
  # has_one :notification, as: :subject, dependent: :destroy

  # after_create_commit :create_notifications
  
   validates :message, presence: true, length: { maximum: 140 }
   
  #   private
  
  # def create_notifications
  #   entry = Entry.where.not(user_id: chat.user.id).where().first
  #   Notification.create(subject: self, user: entry.user, action_type: :chated_to_me)
  # end
  
end
