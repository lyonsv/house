class AddStatusToGroceryList < ActiveRecord::Migration
  def change
    add_column :grocery_lists, :status, :boolean
  end
end
