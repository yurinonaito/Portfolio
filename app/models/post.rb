class Post < ApplicationRecord
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :image
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.jpg')
      image.attach(io: File.open(file_path), filename: 'NoImage.jpg', content_type: 'image/jpg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
end
