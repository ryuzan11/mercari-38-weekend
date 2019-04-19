class ItemsController < ApplicationController

before_action :set_item, only: [:edit, :update, :destroy,:confirm_buy, :pay, :complete_buy]

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

  def detail
  end

  def destroy
    item = Item.find(params[:id])
    item.destroy
    redirect_to "/users/profile"
  end

  def complete_buy
    @image = @item.images.first.image
  end

  def confirm_buy
    @image = @item.images.first.image
  end

  def check
    @item = Item.find(params[:id])
  end

  def pay
    ActiveRecord::Base.transaction do
      if @item.status === "1"
        require 'payjp'
        Payjp.api_key = 'sk_test_fe7225e65340815dd04c2084'
        charge = Payjp::Charge.create(
          amount: @item.price,
          card: params['payjp-token'],
          currency: 'jpy'
        )
        @item.update(status: 2, buyer_id: current_user.id)
      else
        raise
      end
    end
        redirect_to action: :complete_buy, id: @item.id , notice: '購入手続きが完了しました。'

  rescue => e
    redirect_to item_path(@item), alert: '購入に失敗しました。'
  end







  private

  def set_item
    @item = Item.find(params[:id])
  end

  def  item_params
    params.require(:item).permit(:name, :price, :condition, :info, :size, :delivery_fee, :delivery_method, :departure_area, :departure_day, :category_id, :brand_id,
      images_attributes: [:id, :image, :item_id,:_destroy],
      brand_attributes: [:id, :name, :brand_id]
      ).merge(user_id: current_user.id,status: 1)
  end

  def  item_update_params
    params.require(:item).permit(:name, :price, :condition, :info, :size, :delivery_fee, :delivery_method, :departure_area, :departure_day, :category_id, :brand_id,
      images_attributes: [:id, :image, :item_id,:_destroy]
      ).merge(user_id: current_user.id,status: 1)
  end


end
