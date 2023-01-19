class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  validates :name, presence: true, length: { in: 5..30 }
  validates :posts_counter, presence: true, length: { in: 1..10 }, numericality: { only_integer: true }

  def user_posts
    Post.where('author_id = ?', id).limit(3)
  end
end
