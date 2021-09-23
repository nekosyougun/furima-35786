class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new]

  def index
    @items = Item.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:name, :text, :introduction, :price, :category_id, :prefecture_id, :days_to_ship_id,
                                 :delivery_cost_id, :item_condition_id, :image).merge(user_id: current_user.id)
  end
end
