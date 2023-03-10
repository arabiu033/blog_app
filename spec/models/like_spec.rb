require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'should update post likes counter' do
    user = User.create(name: 'Korra', photo: '', bio: '', posts_counter: 0)
    pos = Post.create(author: user, title: 'Humanity', text: 'Yello Humanity', comments_counter: 0, likes_counter: 0)
    like = Like.create(author: user, post: pos)
    like.update_post_likes_counter

    expect(Post.find(pos.id).likes_counter).to eql 1
  end
end
