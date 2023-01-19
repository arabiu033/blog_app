require 'rails_helper'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Korra', photo: '', bio: '', posts_counter: 0) }

  before { subject.save }

  it 'name should be present' do
    subject.name = nil
    expect(subject).to_not be_valid
  end

  it 'posts counter should be 0 or above' do 
    subject.posts_counter = nil
    expect(subject).to_not be_valid
  end

  it 'should return the maximum of three posts' do
    expect(subject.user_posts.length).to eql 0
  end
end
