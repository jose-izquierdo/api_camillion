if Rails.env.development?
  FactoryBot.create(:user, :admin)
  FactoryBot.create_list(:user, 10, :user)
  FactoryBot.create_list(:item, 10, user: User.all.sample)
end