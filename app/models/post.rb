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
  
    #「ログイン中のユーザーがその投稿に対していいねをしているか」を判断する
  def favorite?(user)
  favorites.where(user_id: user.id).exists?
  end                 #(current_user)のidと等しいuser_idを持つレコードは、favoritesテーブル内に存在するか？」をexists?を用いて判断
                      #一致するレコードが存在しない＝「まだいいねしていない→createアクションへ」
                      #一致するレコードが存在する　＝「すでにいいね済み→destroyアクションへ」と分岐
  
end
