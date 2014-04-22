class CoinsController < ApplicationController
  before_filter :authenticate_user!

  expose(:chests) { current_user.chests }
  expose(:chest)
  expose(:coins) { chest.coins }
  expose(:coin, attributes: :coin_params)

  def index; end
  def new; end

  def create
    if coin.save
      flash[:success] = "Coin was successfully added to #{chest.name}."
      redirect_to chest
    else
      render :new
    end
  end

  private

  def coin_params
    params.require(:coin).permit(:value)
  end
end
