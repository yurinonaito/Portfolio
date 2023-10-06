class Post < ApplicationRecord
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  
  has_one_attached :image
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.png')
      image.attach(io: File.open(file_path), filename: 'NoImage.png', content_type: 'image/p')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
end
