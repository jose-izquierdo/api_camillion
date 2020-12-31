module Api::V1
  class ItemsController < ApiController
    # Index /items/
    #  ACTION GET
    #  REQUIRED
    #   [Header parameter] API-TOKEN
    #   [Header parameter] AUTH-TOKEN
    #
    #  RESPONSE [JSON]
    #   [
    #      {
    #        "id": 1,
    #        "title": "A new hope",
    #        "content": "It is a period of civil wars in the galaxy. A brave alliance of underground freedom fighters has challenged the tyranny and oppression of the awesome GALACTIC EMPIRE.",
    #        "user": {
    #           "id": 1,
    #           "email": "luke@rebellion.com"
    #         },
    #       },
    #       {
    #        "id": 2,
    #        "title": "The Empire strikes back",
    #        "content": "It is a dark time for the Rebellion. Although the Death Star has been destroyed, Imperial troops have driven the Rebel forces from their hidden base and pursued them across the galaxy.",
    #        "user": {
    #           "id": 1,
    #           "email": "vader@empire.com"
    #         },
    #      }
    #   ]
    def index
      @items =  authorize do_paginate(Item.all, params[:page])  
      render json: @items, status: :ok
    end

    # Create /items/
    #  ACTION POST
    #  REQUIRED
    #   [Header parameter] API-TOKEN
    #   [Header parameter] AUTH-TOKEN
    #   [Text] title
    #   [Text] content
    #   [Integer] user_id
    #
    #  RESPONSE [JSON]
    #      {
    #        "id": 3,
    #        "title": "The return of the Jedi",
    #        "content": "Luke Skywalker has returned to his home planet of Tatooine in an attempt to rescue his friend Han Solo from the clutches of the vile gangster Jabba the Hutt.",
    #        "user": {
    #           "id": 3,
    #           "email": "luke@rebellion.com"
    #         },
    #       }
  
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