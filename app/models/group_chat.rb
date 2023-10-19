class GroupChat < ApplicationRecord
  belongs_to :user
  belongs_to :group_room
  
  has_one :notification, as: :subject, dependent: :destroy

  after_create_commit :create_notifications
  
   validates :message, presence: true, length: { maximum: 140 }
   
    private
  
      def create_notifications
      # 1. グループチャットのルームにエントリーしているユーザーのリストを取得
      group_entry_users = group_room.group_entries.where.not(user_id: user.id).map(&:user)
    
      # 2. 取得したユーザーリストに通知を作成
      group_entry_users.each do |group_entry_user|
        Notification.create(subject: self, user: group_entry_user, action_type: :groupchated_to_me)
      end
    end

end
