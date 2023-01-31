require 'faker'

FactoryGirl.define do
  factory :post do
    title { Faker::Hipster.words(number: 2).join(' ') }
    text { Faker::Hipster.paragraph }
    comments_counter 0
    likes_counter 0
    author { user }
  end
end
