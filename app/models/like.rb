class Like < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def updatePostLikesCounter
    count = Like.where('post_id = ?', self.post_id).count
    Post.find(self.post_id).update(likes_counter: count)
  end
end