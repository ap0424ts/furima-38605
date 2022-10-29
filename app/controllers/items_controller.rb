class ItemsController < ApplicationController
  def index
  end

  private

  def item_params
    params.require(:item).permit(:name, :content, :price, :category_id, :condition_id, :charge_id, :area_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
