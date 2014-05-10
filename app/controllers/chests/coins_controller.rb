class Chests::CoinsController < CoinsController

  expose(:chest) { current_user.chests.find(params[:chest_id]) }

  protected
  def coin_params
    params.require(:coin).permit(:value, :category_id, :created_at,
      :is_recurrent, :period).
      merge({ chest_id: params[:chest_id], user_id: current_user.id })
  end
end
