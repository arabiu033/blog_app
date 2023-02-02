class Like < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_post_likes_counter

  def update_post_likes_counter
    Post.increment_counter(:likes_counter, post_id)
  end
end
