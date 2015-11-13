class GroceriesController < ApplicationController
  def new
    @grocery = Grocery.new
  end

  def create
    @grocery = Grocery.new(grocery_params)
    respond_to do |format|
      if @grocery.save
        format.html { redirect_to root_url, notice: 'Grocery was successfully created.' }
      else
        format.html { render :new}
        format.json { render json: @grocery.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def grocery_params
    params.require(:grocery).permit(:name, :price)
  end
end
