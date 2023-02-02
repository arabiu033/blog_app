require 'faker'

FactoryGirl.define do
  factory :user do
    name { Faker::Name.name }
    photo 'https://images.unsplash.com/photo-1560365163-3e8d64e762ef?ixlib=rb-4.0.3&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTB8fHNtaWxpbmclMjBmYWNlfGVufDB8fDB8fA%3D%3D&w=1000&q=80'
    bio { Faker::Hipster.paragraph }
    posts_counter 0
    email { "#{Faker::Hipster.words(number: 1).join(' ')}@gmail.com" }
    password '123456'
  end
end
