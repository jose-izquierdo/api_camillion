RSpec.describe Item, type: :model do
  describe 'Relations' do
    it { should belong_to(:user) }
  end

  describe 'Validations' do
    it { should validate_presence_of(:title) }
    it { should validate_presence_of(:content) }
  end
end
