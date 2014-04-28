class CoinsController < AdminController
  before_filter :authenticate_user!

  expose(:categories) { current_user.categories }
  expose(:chests) { current_user.chests }
  expose(:chest)
  expose(:coins) { current_user.coins }
  expose(:coin, attributes: :coin_params)

  def index; end
  def new; end

  def create
    if coin.save && create_recurrent
      flash[:success] = "Coin was successfully added to #{chest.name}."
      redirect_to chest
    else
      render :new
    end
  end

  private

  def coin_params
    params.require(:coin).permit(:value, :category_id, :created_at,
      :is_recurrent, :period).
      merge(chest_id: params[:chest_id])
  end

  def create_recurrent
    recurrent = Coin.new(coin_params)
    recurrent.is_recurrent = false
    recurrent.save
  end
end
