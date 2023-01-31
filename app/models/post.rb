class Post < ApplicationRecord
  has_many :likes
  has_many :comments
  belongs_to :author, class_name: 'User'
  after_save :update_user_posts_counter

  validates :title, presence: true, length: { in: 6..25 }
  validates :comments_counter, presence: true, length: { in: 1..10 }, numericality: { only_integer: true }
  validates :likes_counter, presence: true, length: { in: 1..10 }, numericality: { only_integer: true }

  def update_user_posts_counter
    count = Post.where('author_id = ?', author_id).count
    User.find(author_id).update(posts_counter: count)
  end

  def post_comments
    Comment.includes(:author, :post).order(updated_at: :desc).limit(5)
    # Comment.where('post_id = ?', id).order(updated_at: :desc).limit(5)
  end
end
