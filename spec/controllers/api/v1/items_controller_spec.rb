RSpec.describe Api::V1::ItemsController, type: :controller do
  let(:admin) {create :user, :admin}
  let(:user) {create :user, :user}
  
  describe 'create' do
    before do
      api_auth
      user_auth(admin.authentication_token)
    end

    context 'with admin user' do
      before do
        @item = {title: Faker::Lorem.sentence, content: Faker::Lorem.paragraph, user_id: user.id}
        page.driver.post(items_path, {item: @item})
      end

      it 'must return status code 201' do
        expect(page.status_code).to match 201
      end
      
      it 'must save an Item' do
        expect(Item.count).to match 1
      end

      it 'must save the item with the right params' do
        item = Item.last
        
        expect(item.title).to match @item[:title]
        expect(item.content).to match @item[:content]
        expect(item.user_id).to match @item[:user_id]
      end
    end

    context 'with NOT admin user' do
      before do
        user_auth(user.authentication_token)
        item = {title: 'Unauth', content: 'Unauth', user_id: user.id}
        page.driver.post(items_path, {item: item})
      end
      
      it 'must return 401' do
        expect(page.status_code).to match 401
      end

      it 'must NOT save the item' do 
        expect(Item.count).to match 0
      end
    end

    context 'with invalid params' do
      before do
        item = {title: 'Invalid', content: 'Invalid'}
        page.driver.post(items_path, {item: item})
      end
      
      it 'must return 422' do
        expect(page.status_code).to match 422
      end

      it 'must NOT save the item' do
        expect(Item.count).to match 0
      end
    end
  end
end
  