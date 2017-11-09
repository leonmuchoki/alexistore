class SalesController < ApplicationController
  def new
  	@sale = Sale.new
  	@items = Item.all
  end

  def create
  	@sale = Sale.new(sale_params)

  	respond_to do |format|
      if @sale.save!
        
        update_quantity

        format.html { render :show, notice: "Sale created successfully." }
        format.json { render json: @sale }
      else
        format.html { render :new, notice: "Sale was not created!" }
        format.json { render json: @sale.errors }
      end
    end
  end

  def update_quantity
    params[:sale][:sale_items_attributes].values.each do |item|
      items = Item.find(item[:item_id])
      items.quantity = items.quantity.to_i - item[:quantity].to_i
      items.save!
    end if params[:sale] and params[:sale][:sale_items_attributes]
  end

  private
     def set_item
       @item = Item.find(params[:id])
     end

    def sale_params
      params.require(:sale).permit(:amount, sale_items_attributes: [:item_id,:price, :quantity])
    end
end
