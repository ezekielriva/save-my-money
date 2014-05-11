class CoinsController < AdminController
  before_filter :authenticate_user!

  expose(:categories) { current_user.categories }
  expose(:filter_date) { date_params }
  expose(:coins) { current_user.coins }
  expose(:coin, attributes: :coin_params)
  expose(:chests) { current_user.chests }
  expose(:chest) { coin.chest }
  expose(:filtered_coins) { current_user.coins.by_date(date_params) }

  def index; end
  def new; end
  def edit; end

  def create
    if coin.save && create_recurrent
      flash[:success] = "Coin was successfully added to #{chest.name}."
      redirect_to coin.chest
    else
      render :new
    end
  end

  def update
    if coin.save && create_recurrent
      flash[:success] = "Coin was successfully updated."
      redirect_to coin.chest
    else
      render :edit
    end
  end

  private

  def date_params
    if params[:date]
      return ("1-" + params[:date].values.join('-') ).to_date
    end
    Date.today
  end

  def create_recurrent
    if coin.is_recurrent
      recurrent = Coin.new(coin_params)
      recurrent.is_recurrent = false
      recurrent.parent = coin
      return recurrent.save
    end
    true
  end

  protected
  def coin_params
    params.require(:coin).permit(:value, :category_id, :created_at,
        :is_recurrent, :period, :chest_id)
  end
end
