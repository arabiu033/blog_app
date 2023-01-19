require 'rails_helper'

RSpec.describe Like, type: :model do

  it 'should update post likes counter' do
    user = User.create(name: 'Korra', photo: '', bio: '', posts_counter: 0)
    pos = Post.create(author: user, title: 'Humanity', text: 'Yello Humanity', comments_counter: 0, likes_counter: 0)
    comment = Comment.create(author: user, post: pos, text: 'Hello everyone')
    comment.update_post_comments_counter

    expect(Post.find(pos.id).comments_counter).to eql 1
  end
end
