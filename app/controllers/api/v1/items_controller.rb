module Api::V1
  class ItemsController < ApiController
    def index
    end
    def create
      @item = authorize Item.new(item_params)
      render json: @item, status: :created if @item.save!
    end

    private

    def item_params
      params.require(:item).permit(:title, :content, :user_id)
    end
  end
end