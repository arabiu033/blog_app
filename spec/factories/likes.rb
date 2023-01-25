require 'faker'

FactoryGirl.define do
  factory :like do
    post { post }
    author { post.author }
  end
end