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
  
  def get_icon_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.jpg')
      image.attach(io: File.open(file_path), filename: 'NoImage.jpg', content_type: 'image/jpg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
end
