class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def user_posts
    Post.where('owner_id = ?', id).limit(3)
  end
end
