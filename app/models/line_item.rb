class LineItem < ActiveRecord::Base
  belongs_to :grocery
  
  def name
    self.grocery.name
  end
end
