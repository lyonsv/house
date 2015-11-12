class AddListToLineItems < ActiveRecord::Migration
  def change
    add_reference :line_items, :grocery_list, index: true, foreign_key: true
  end
end
