class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.build
    # @categories = Category.all
  end

  def create
    @item = Item.create(item_params)

    # if @item.save
    #   @item.images.create(item_id: @item.id)
    # else
     render action: :new
    # end


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
    params.require(:item).permit(:name, :price, :condition, :info, :size, :delivery_fee, :delivery_method, :departure_area, :departure_day, :category_id, :brand_id,
      images_attributes: [:image, :item_id]
      ).merge(user_id: current_user.id,status: 1)
  end

end
