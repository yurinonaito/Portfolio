module NotificationsHelper
  
  def transition_path(notification)
    case notification.action_type.to_sym
    #通知のアクションタイプに応じて、適切な遷移パスを生成
    when :commented_to_own_post
      post_path(notification.subject.post, anchor: "comment-#{notification.subject.id}")
    when :favorited_to_own_post
      post_path(notification.subject.post)
    when :followed_me
      user_path(notification.subject.follower)
    when :chated_to_me
      room_path(notification.subject.room, anchor: "room-#{notification.subject.id}")
    when :groupchated_to_me
      group_room_path(notification.subject.group_room, anchor: "group_room-#{notification.subject.id}")
    end
  end
end
