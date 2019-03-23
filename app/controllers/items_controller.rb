class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    # @categories = Category.all
  end

  def create
    @item = Item.create(item_params)

     render action: :new
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def show
  end

  def detail
  end

  def confirm_buy
  end

  private

  def  item_params
    params.require(:item).permit(:name, :category_id, :price, :info, :condition, :delivery_fee, :departure_area, :departure_day).merge(user_id: current_user.id,status: 1)
  end

end
