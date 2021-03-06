class ChestsController < AdminController

  expose(:chests) { current_user.chests }
  expose(:chest, attributes: :chest_params)
  expose(:coins) { chest.coins.no_recurrent }
  expose(:balance) { chest.balance }

  def index; end
  def new; end
  def edit; end

  def create
    if chest.save
      flash[:success] = 'Chest was successfully created.'
      redirect_to chest
    else
      render :new
    end
  end

  def update
    if chest.save
      flash[:success] = 'Chest was successfully updated.'
      redirect_to chest
    else
      render :edit
    end
  end

  private

  def chest_params
    params.require(:chest).permit(:name)
  end
end
