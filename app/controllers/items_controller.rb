class ItemsController < ApplicationController
  before_action :authenticate_user!, expect: [:index, :show]
  before_action :authenticate_user!, only: [:new, :edit, :destroy]

  def index
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
    params.require(:item).permit(:image, :item_name, :price, :description, :category_id, :status_id, :shipping_charge_id, :delivery_area_id, :estimated_delivery_date_id).merge(user_id: current_user.id)
  end

end