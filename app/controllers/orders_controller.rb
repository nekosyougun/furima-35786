class OrdersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :new, :create]
  before_action :new_order, only: [:index, :new]
  before_action :item_find, only: [:index, :create]

  def index
    redirect_to root_path if @item.user_id == current_user.id || !@item.order.nil?
  end

  def new
  end

  def create
    @order_address = OrderAddress.new(order_params)
    if @order_address.valid?
      pay_item
      @order_address.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_address).permit(:postal_code, :prefecture_id, :city, :house_number, :telephone_number, :building_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def new_order
    @order_address = OrderAddress.new
  end

  def item_find
    @item = Item.find(params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
