class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_post_comments_counter

  def update_post_comments_counter
    count = Comment.where('post_id = ?', post_id).count
    Post.find(post_id).update(comments_counter: count)
  end
end
