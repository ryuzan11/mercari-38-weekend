class ItemsController < ApplicationController

  def index
    items = Item.all
    @itemsLadies = items.where(category_id: 1).limit(4)
    @itemsMens = items.where(category_id: 2).limit(4)
    @itemsKids = items.where(category_id: 3).limit(4)
    @itemsCosme = items.where(category_id: 4).limit(4)
    @itemsAdidas = items.where(brand_id: 1).limit(4)
    @itemsLacoste = items.where(brand_id: 3).limit(4)
    @itemsChanel = items.where(brand_id: 2).limit(4)
    @itemsShips = items.where(brand_id: 4).limit(4)

    # イメージの取り出しを記載
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
