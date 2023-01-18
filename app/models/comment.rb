class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post

  def update_post_comments_counter
    count = Comment.where('post_id = ?', post_id).count
    Post.find(post_id).update(comments_counter: count)
  end
end
