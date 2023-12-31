class Chat < ApplicationRecord
  belongs_to :user
  belongs_to :room
  
  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications
  
  validates :content, presence: true, length: { maximum: 140 }
  
  private
  
  def create_notifications
    # ルームにエントリーしている自分以外のユーザーに通知を
    entry = Entry.where.not(user_id: user.id).where(room_id: room.id).first
    Notification.create(subject: self, user: entry.user, action_type: :chated_to_me)
  end
  
end