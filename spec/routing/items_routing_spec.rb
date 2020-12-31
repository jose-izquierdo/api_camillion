RSpec.describe Api::V1::ItemsController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/items").to route_to("api/v1/items#index")
    end

    it "routes to #create" do
      expect(:post => "/items").to route_to("api/v1/items#create")
    end
  end
end