require 'rails_helper'

RSpec.describe Post, type: :model do
  subject { Post.new(title: 'Humanity', text: 'Yello Humanity', comments_counter: 0, likes_counter: 0) }

  before { subject.save }

  it 'title must be there' do
    subject.title = nil
    expect(subject).to_not be_valid
  end

  it 'title must not be too long' do
    subject.title = 'Humanity' * 50
    expect(subject).to_not be_valid
  end

  it 'comments counter should be 0 or above' do 
    user = User.create(name: 'Korra', photo: '', bio: '', posts_counter: 0)
    subject.update(author: user)
    subject.comments_counter = nil
    expect(subject).to_not be_valid
  end

  it 'likes counter should be 0 or above' do 
    user = User.create(name: 'Korra', photo: '', bio: '', posts_counter: 0)
    subject.update(author: user)
    subject.likes_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should bring print the recent five comments on a post' do
    user = User.create(name: 'Korra', photo: '', bio: '', posts_counter: 0)
    subject.update(author: user)
    subject.save
    expect(subject.post_comments.length).to eql 0
    Comment.create(post: subject, author: user, text: 'Hi Tom!' )
    expect(subject.post_comments.length).to eql 1
    Comment.create(post: subject, author: user, text: 'Hi Jerry!' )
    expect(subject.post_comments.length).to eql 2
  end
end
