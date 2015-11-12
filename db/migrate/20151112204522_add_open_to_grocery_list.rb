class AddOpenToGroceryList < ActiveRecord::Migration
  def change
    add_column :grocery_lists, :open, :boolean
  end
end
