class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user

  def updateUserPostsCounter
    count = Post.where('user_id = ?', self.user_id).count
    User.find(self.user_id).update(posts_counter: count)
  end

  def getPostComments
    Comment.where('post_id = ?', self.id).limit(5)
  end
end