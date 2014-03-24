class ChestsController < ApplicationController
  before_filter :authenticate_user!

  expose(:chests) { current_user.chests }
  expose(:chest, attributes: :chest_params)

  def index; end
  def new; end

  def create
    if chest.save
      flash[:success] = 'Chest was successfully created.'
      redirect_to chest
    else
      render :new
    end
  end

  private

  def chest_params
    params.require(:chest).permit(:name)
  end
end
