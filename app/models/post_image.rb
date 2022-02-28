class PostImage < ApplicationRecord
  
  has_one_attached :image
  belongs_to :user
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  
  validates :shop_name, presence: true
  validates :image, presence: 
  
  def get_image
    if image.attached?
      image
    else
      'no_image.jpg'
    end  
  end  
  
  # 自分が含まれてるか(自分がいいねを押したか)を判断する用のメソッド　post_imageのshowで使用
  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end  
end
