class ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    if user_signed_in?
      @item = Item.new
      @item.images.build
    else
      redirect_to user_session_path
    end
  end

  def create
    @item = Item.new(item_params) 
    if @item.save
      redirect_to root_path
    else 
      redirect_to new_item_path
    end
  end

  def edit
  end

  def show
    @item = Item.find(params[:id])
    @prefectures = Prefecture.all

  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:introduction,:prefecture_name,:condition_id,:postage_payer,:preparation_day,images_attributes: [:url]).merge(seller_id:current_user.id)
  end
end
