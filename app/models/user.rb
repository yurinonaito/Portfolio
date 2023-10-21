class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  # フォローをした、されたの関係
  has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy
  has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy
  # 一覧画面で使う
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  has_many :group_entries, dependent: :destroy
  has_many :group_chats, dependent: :destroy
  has_many :group_rooms, through: :group_entries, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :rooms, through: :entries, dependent: :destroy
  has_many :notifications, dependent: :destroy
  
  has_one_attached :icon_image
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.last_name = "ゲスト"
      user.first_name ="ログイン"
      user.user_name ="guest"
      user.telephone_number ="090000000000"
      # user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば user_name を入力必須としているならば， user.user_name = "ゲスト" なども必要
    end
  end
  
  def guest?
    user_name =="guest"
  end
  
  def get_icon_image(width, height)
    unless icon_image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.jpg')
      icon_image.attach(io: File.open(file_path), filename: 'NoImage.jpg', content_type: 'image/jpg')
    end
      icon_image.variant(resize_to_limit: [width, height]).processed
  end
  
    # is_deletedがfalseならtrueを返すようにしている
  def active_for_authentication?
    super && (is_deleted == false)
  end

  
  # ユーザーが特定のユーザーにフォローされているかどうかを確認するメソッド
  def followed_by?(other_user)
    other_user.following?(self)
  end
  
  # 指定したユーザーをフォローする
  def follow(user)
    active_relationships.create(followed_id: user.id)
    if mutual_followings.map(&:id).include?(user.id)
       Room.find_or_create_by(user_id: user.id) do |room|
         room.user_id = user.id
       end
    end
  end
  # 指定したユーザーのフォローを解除する
  def unfollow(user)
    active_relationships.find_by(followed_id: user.id).destroy
  end
  # 指定したユーザーをフォローしているかどうかを判定
  def following?(user)
    followings.include?(user)
  end
  
  # 相互フォロー一覧を取得
  def mutual_followings
    following_users = self.followings
    followers_users = self.followers
    mutual_followings = following_users & followers_users
    mutual_followings
  end
  
  # 検索方法分岐
  def self.search(search, word)
    if search == "perfect_match"
      where("user_name LIKE ?", word)
    elsif search == "forward_match"
      where("user_name LIKE ?", "#{word}%")
    elsif search == "backward_match"
      where("user_name LIKE ?", "%#{word}")
    elsif search == "partial_match"
      where("user_name LIKE ?", "%#{word}%")
    else
      all
    end
  end
  
  def self.looks(search, word)
    if search == "perfect_match"
      where("user_name LIKE ?", "#{word}")
    elsif search == "forward_match"
      where("user_name LIKE ?", "#{word}%")
    elsif search == "backward_match"
      where("user_name LIKE ?", "%#{word}")
    elsif search == "partial_match"
      where("user_name LIKE ?", "%#{word}%")
    else
      all
    end
  end
  
  enum status:{nonreleased: 0, released: 1}
  
end
