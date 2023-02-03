class Comment < ApplicationRecord
  belongs_to :author, class_name: 'User'
  belongs_to :post
  after_save :update_post_comments_counter

  def update_post_comments_counter
    Post.increment_counter(:comments_counter, post_id)
  end

  def as_json(_options = {})
    super(only: %i[id text])
  end
end
