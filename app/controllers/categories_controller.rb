class CategoriesController < AdminController
  expose(:categories) { current_user.categories }
  expose(:category, attributes: :category_params)
  expose(:coins) { category.coins }

  def index; end
  def new; end
  def edit; end
  def show; end

  def create
    if category.save
      flash[:success] = 'Category was successfully created.'
      redirect_to category
    else
      render :new
    end
  end

  def update
    if category.save
      flash[:success] = 'Category was successfully updated.'
      redirect_to category
    else
      render :edit
    end
  end

  private

  def category_params
    params.require(:category).permit(:name).merge({ user_id: current_user.id })
  end

end
