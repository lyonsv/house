class DashboardController < ApplicationController
  def index
    @groceries = Grocery.all
    @line_items = GroceryList.last.line_items
  end
end
