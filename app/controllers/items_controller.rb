class ItemsController < ApplicationController

before_action :set_item, only: [:edit, :update, :destroy]

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
  end

  def create
    @item = Item.new(item_params)

    if @item.brand
      @item.brand = Brand.find_or_create_by(name: @item.brand.name)
    end

    if @item.save
      redirect_to root_path
    else
      render action: :new
    end
  end

  def edit
    @item = Item.new unless @item
  end

  def show
    @item = Item.find(params[:id])
    @images = Image.includes(:item)
    @ownerItems = Item.where( "user_id = ?", @item.user_id ).limit(6)
    @brandItems = Item.where( "brand_id = ?", @item.brand_id ).limit(6)
  end

  def update
    if @item.brand
      @item.brand = Brand.find_or_create_by(name: @item.brand.name)
      @item.brand_id = @item.brand.id
    end

    if @item.update(item_update_params)
      redirect_to items_detail_path
    else
      render action: :edit
    end
  end


  def destroy
  end

  def detail
  end

  def confirm_buy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def  item_params
    params.require(:item).permit(:name, :price, :condition, :info, :size, :delivery_fee, :delivery_method, :departure_area, :departure_day, :category_id, :brand_id,
      images_attributes: [:id, :image, :item_id],
      brand_attributes: [:id, :name, :brand_id]
      ).merge(user_id: current_user.id,status: 1)
  end

  def  item_update_params
    params.require(:item).permit(:name, :price, :condition, :info, :size, :delivery_fee, :delivery_method, :departure_area, :departure_day, :category_id, :brand_id,
      images_attributes: [:id, :image, :item_id]
      ).merge(user_id: current_user.id,status: 1)
  end


end
