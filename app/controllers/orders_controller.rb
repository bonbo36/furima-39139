class OrdersController < ApplicationController

  def index
    @form = Form.new
  end

  def create
    @form = Form.new(order_params)
    if @form.valid?
      @form.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:form).permit(:post_code, :delivery_area_id, :municipality, :address, :building_name, :room_number, :shipping_charge_id).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
