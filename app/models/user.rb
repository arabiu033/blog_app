class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable
         
  has_many :posts, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
  after_initialize :initialize_post_counter

  validates :name, presence: true, length: { in: 5..30 }
  validates :posts_counter, presence: true, length: { in: 1..10 }, numericality: { only_integer: true }

  def user_posts
    Post.where('author_id = ?', id).limit(3)
  end

  def admin?
    self.role == 'admin'
  end

  def initialize_post_counter
    self.posts_counter = 0 unless posts_counter
    self.photo = 'https://images.unsplash.com/photo-1560365163-3e8d64e762ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNtaWxpbmclMjBmYWNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80'
  end
end
