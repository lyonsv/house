class LineItemsController < ApplicationController
  before_action :set_grocery_list, only: [:create, :update, :destroy]

  def new
  end

  def create
    if @grocery_list.line_items.find_by(grocery_id: line_item_params[:grocery_id]).present?
      @line_item = @grocery_list.line_items.find_by(grocery_id: line_item_params[:grocery_id])
      update_line_item(params, @line_item)
    else
      unless params[:quantity].to_i == -1
        @line_item = LineItem.create(
          grocery_list_id: @grocery_list.id,
          grocery_id: line_item_params[:grocery_id],
          quantity: 1
          )
        respond_to do |format|
          if @line_item.save
            format.js {render layout: false}
          end
        end
      end
    end
  end


  private

  def update_line_item(params, line_item)
    line_item.update_attributes(quantity: (line_item.quantity + params[:quantity].to_i))
    respond_to do |format|
      if @line_item.quantity == 0 
        line_item.delete
        format.js {render layout: false}
      else 
        @line_item.save
        format.js {render layout: false}        
      end
    end
  end
  

  def line_item_params
    params.permit(:id, :grocery_id, :quantity)
  end

  def set_grocery_list 
    @grocery_list = GroceryList.last
  end
end

