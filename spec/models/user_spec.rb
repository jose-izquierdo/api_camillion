RSpec.describe User, type: :model do
  describe 'Validations' do
    it { should validate_uniqueness_of(:email) }
  end
end
