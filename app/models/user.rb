class User < ApplicationRecord
  has_many :posts
  has_many :likes
  has_many :comments

  def getPosts
    Post.where('user_id = ?', self.id).limit(3)
  end
end