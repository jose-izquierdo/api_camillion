RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_uniqueness_of(:email) }
  end

  describe 'save' do
    let(:user) {create :user}

    it 'must assign an auth token' do
      expect(user.authentication_token.blank?).to be false
    end
  end
end
