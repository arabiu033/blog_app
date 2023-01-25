require 'faker'

FactoryGirl.define do
  factory :comment do
    text { Faker::Hipster.paragraph }
    post { post }
    author { post.author }
  end
end
