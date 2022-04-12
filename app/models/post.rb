class Post < ApplicationRecord
  has_one_attached :image
  belongs_to :user
  belongs_to :genre
  has_many :comments, dependent: :destroy
  validates :title, presence:true
  validates :caption, presence:true, length: { maximum: 200 }
  
  
  # def get_image(width, height)
  #   unless image.attached?
  #     file_path = Rails.root.join('app/assets/images/no_image.jpg')
  #     image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
  #   end
  #   image.variant(resize_to_limit: [width, height]).processed
  # end
end
