class ItemsController < ApplicationController

  def index
  end

  def new
  end

  def edit
  end

  def create
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
  end

end
