class DashboardController < ApplicationController
  def index
    @groceries = Grocery.all
    @line_items = GroceryList.last.line_items
    @groceries_list = GroceryList.last
  end
end
