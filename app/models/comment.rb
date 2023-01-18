class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def updatePostCommentsCounter
    count = Comment.where('post_id = ?', self.post_id).count
    Post.find(self.post_id).update(comments_counter: count)
  end
end