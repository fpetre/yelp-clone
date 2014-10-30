

FactoryGirl.define do
  factory :user do |user|
    user.username {Faker::Internet.user_name}
    user.password {Faker::Internet.password(6)}
  end
end