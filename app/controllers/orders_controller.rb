class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
    @form = Form.new
    if current_user == @item.user || @item.purchase_record != nil 
      redirect_to root_path
    end
  end

  def create
    @item = Item.find(params[:item_id])
    @form = Form.new(order_params)
    if @form.valid?
      pay_item
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form).permit(:post_code, :delivery_area_id, :municipality, :address, :building_name, :room_number, :shipping_charge_id).merge(user_id: current_user.id, item_id: params[:item_id],token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
    end

end
