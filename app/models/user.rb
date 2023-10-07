class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  has_many :posts, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :relationships, dependent: :destroy
  has_many :group_entries, dependent: :destroy
  has_many :group_chats, dependent: :destroy
  has_many :group_rooms, dependent: :destroy
  has_many :entries, dependent: :destroy
  has_many :chats, dependent: :destroy
  has_many :rooms, dependent: :destroy
  
  has_one_attached :icon_image
  
  def self.guest
    find_or_create_by!(email: 'guest@example.com') do |user|
      user.password = SecureRandom.urlsafe_base64
      user.confirmed_at = Time.now  # Confirmable を使用している場合は必要
      # 例えば name を入力必須としているならば， user.name = "ゲスト" なども必要
    end
  end
  
  def get_icon_image(width, height)
    unless icon_image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.png')
      icon_image.attach(io: File.open(file_path), filename: 'NoImage.png', content_type: 'image/png')
    end
      icon_image.variant(resize_to_limit: [width, height]).processed
  end
  
end
