class Post < ApplicationRecord
  belongs_to :user
  
  has_many :favorites, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_many :post_hashtag_relations
  has_many :hashtags, through: :post_hashtag_relations
  
  has_one_attached :image
  has_one :notification, as: :subject, dependent: :destroy
  
  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/NoImage.jpg')
      image.attach(io: File.open(file_path), filename: 'NoImage.jpg', content_type: 'image/jpg')
    end
      image.variant(resize_to_limit: [width, height]).processed
  end
  
  
    #「ログイン中のユーザーがその投稿に対していいねをしているか」を判断する
  def favorite?(user)
  favorites.where(user_id: user.id).exists?
  end                 #(current_user)のidと等しいuser_idを持つレコードは、favoritesテーブル内に存在するか？」をexists?を用いて判断
                      #一致するレコードが存在しない＝「まだいいねしていない→createアクションへ」
                      #一致するレコードが存在する＝「すでにいいね済み→destroyアクションへ」と分岐
  
  
  # 検索方法分岐
  def self.search(search, word)
    if search == "perfect_match"
      where("caption LIKE ?", word)
    elsif search == "forward_match"
      where("caption LIKE ?", "#{word}%")
    elsif search == "backward_match"
      where("caption LIKE ?", "%#{word}")
    elsif search == "partial_match"
      where("caption LIKE ?", "%#{word}%")
    else
      all
    end
  end
  
  after_create do
    created_post = Post.find_by(id: self.id) # ポストを作成した後、保存されたポストを取得
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    created_post.hashtags = []
    hashtags.uniq.map do |hashtag|
    tag = Hashtag.find_or_create_by(hashname: hashtag.delete('#'))
    created_post.hashtags << tag
    end
  end

  before_update do 
    created_post = Post.find_by(id: self.id) # モデル名を指定する
    created_post.hashtags.clear
    hashtags = self.caption.scan(/[#＃][\w\p{Han}ぁ-ヶｦ-ﾟー]+/)
    hashtags.uniq.map do |hashtag|
      tag = Hashtag.find_or_create_by(hashname: hashtag.delete('#'))
      created_post.hashtags << tag
    end
  end
  
  validates :caption, presence: true
  validates :code_url, presence: true
  validates :post_url, presence: true
  validates :image, presence: true
  
end
