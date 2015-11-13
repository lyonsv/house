class GroceryListController < ApplicationController
  def edit
    @groceries_list = GroceryList.find(params[:id])
    @groceries_list_items = @groceries_list.line_items
  end

  private 
end
