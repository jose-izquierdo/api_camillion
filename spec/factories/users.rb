FactoryBot.define do
  factory :user do
    email { Faker::Internet.email }

    trait :admin do |user|
      after(:create) {|user| user.add_role(:admin)}
    end

    trait :user do |user|
      after(:create) {|user| user.add_role(:user)}
    end
  end
end
