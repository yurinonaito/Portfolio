module NotificationsHelper
  def transition_path(notification)
    case notification.action_type.to_sym
    when :commented_to_own_post
      post_path(notification.subject.post, anchor: "comment-#{notification.subject.id}")
    when :favorited_to_own_post
      post_path(notification.subject.post)
    when :followed_me
      user_path(notification.subject.follower)
    end
  end
end
