class ItemsController < ApplicationController
  before_action :set_item, only: [:show]

  def index
  	@items = Item.all
  end

  def show
  end

  def new
  	@item = Item.new
  end

  def create
  	@item = Item.new(item_params)

  	if @item.save
  	  flash[:notice] = "Item Created Successfully."
  	  redirect_to @item
  	else
  	  flash.now[:alert] = "Item was not created!"
  	  render "new"
  	end
  end

  private
    
    def set_item
      @item = Item.find(params[:id])
    end

    def item_params
      params.require(:item).permit(:name,:partno,:quantity, :price)
    end
end
