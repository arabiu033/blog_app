class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post

  def update_post_likes_counter
    count = Like.where('post_id = ?', post_id).count
    Post.find(post_id).update(likes_counter: count)
  end
end
