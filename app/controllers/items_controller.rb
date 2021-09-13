class ItemsController < ApplicationController
  def index
    @items = Item.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def create
    Item.create(item_params)
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :introduction, :price, :category_id, :prefecture_id, :days_to_ship_id, :delivery_cost_id, :item_condition_id, :image).merge(user_id: current_user.id)
  end
end