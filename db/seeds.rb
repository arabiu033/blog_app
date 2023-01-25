exit if !Rails.env.development?
require 'factory_girl_rails'

puts "Delete the data"
Comment.delete_all
Like.delete_all
Post.delete_all
User.delete_all

puts "Create users"
a = Random.rand(8..15)
a.times do
  FactoryGirl.create(:user)
end

User.all.each do |user|
  a = Random.rand(0..5)
  a.times do
    FactoryGirl.create(:post, :author => user)
  end
end

Post.all.each do |post|
  a = Random.rand(0..5)
  a.times do
    FactoryGirl.create(:comment, :author => post.author, :post => post)
    FactoryGirl.create(:like, :author => post.author, :post => post)
  end
end