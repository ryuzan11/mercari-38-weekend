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

  def show
  end

  def detail
  end

  def confirm_buy
  end

end
