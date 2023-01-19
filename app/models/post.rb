class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :user

  def update_user_posts_counter
    count = Post.where('owner_id = ?', user_id).count
    User.find(user_id).update(posts_counter: count)
  end

  def post_comments
    Comment.where('post_id = ?', id).order(updated_at: :desc).limit(5)
  end
end
