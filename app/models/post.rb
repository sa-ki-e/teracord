class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy
  validates :title, presence:true
  validates :caption, presence:true, length: { maximum: 200 }
  
  def liked_by?(user)
    likes.exists?(user_id: user.id)#ユーザーがいいねしているか？
  end
  
  def self.search(search)
    if search != ""
      Post.where(['title LIKE(?) OR caption LIKE(?)', "%#{search}%", "%#{search}%"])
    else
      Post.includes(:user).order('created_at DESC')
    end
  end
  # def get_image(width, height)
  #   unless image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   image.variant(resize_to_limit: [width, height]).processed
  # end
end
