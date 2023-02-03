class Post < ApplicationRecord
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  belongs_to :author, class_name: 'User'
  after_save :update_user_posts_counter

  validates :title, presence: true, length: { in: 6..25 }
  validates :comments_counter, presence: true, length: { in: 1..10 }, numericality: { only_integer: true }
  validates :likes_counter, presence: true, length: { in: 1..10 }, numericality: { only_integer: true }

  def update_user_posts_counter
    User.increment_counter(:posts_counter, author_id)
  end

  def post_comments
    Comment.includes(:author, :post).where('post_id = ?', id).order(updated_at: :desc).limit(5)
  end

  def as_json(options={})
    super(:only => [:id, :title, :text, :likes_counter, :comments_counter])
  end
end
