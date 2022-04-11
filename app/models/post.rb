class Post < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  validates :title, presence:true
  validates :caption, presence:true, length: { maximum: 200 }
end
