class ItemsController < ApplicationController

  def index
    @items = Item.all
    binding.pry
  end

  def show
  end

  def detail
  end

  def confirm_buy
  end

end
