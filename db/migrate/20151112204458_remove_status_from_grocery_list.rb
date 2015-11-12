class RemoveStatusFromGroceryList < ActiveRecord::Migration
  def change
    remove_column :grocery_lists, :status, :boolean
  end
end
