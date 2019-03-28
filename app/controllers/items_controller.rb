class ItemsController < ApplicationController

  def index
  end

  def new
    @item = Item.new
    @item.images.build
    # @item.brands.build
    # @categories = Category.all
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

  def pay
    Payjp.api_key = 'sk_test_fe7225e65340815dd04c2084
'
    Payjp::Charge.create(
      amount: 10000,
      card: params['payjp-token'],
      currency: 'jpy'
    )
  private

  def  item_params
    params.require(:item).permit(:name, :price, :condition, :info, :size, :delivery_fee, :delivery_method, :departure_area, :departure_day, :category_id, :brand_id,
      images_attributes: [:id, :image, :item_id],
      brand_attributes: [:id, :name, :brand_id]
      ).merge(user_id: current_user.id,status: 1)
  end

end
