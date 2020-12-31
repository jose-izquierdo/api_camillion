RSpec.describe User, type: :model do
  describe 'Relations' do
    it { should have_many(:items) }
  end
  
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
