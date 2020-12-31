FactoryBot.define do
  factory :item do
    title { Faker::Lorem.sentence }
    content { Faker::Lorem.paragraph }
    association :user, factory: :user
  end
end
