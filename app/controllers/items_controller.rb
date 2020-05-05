class ItemsController < ApplicationController
  def index
    @blands = Item.includes(:images).where.not(bland: nil).where(buyer_id: nil).order("created_at DESC").limit(3)
    @newitems = Item.includes(:images).where(buyer_id: nil).order("created_at DESC").limit(3)
  end

  def new
    @item = Item.new
    @item.images.new
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

  end

  def update
  end

  def destroy
  end

  private

  def item_params
    params.require(:item).permit(:name,:price,:introduction,:bland,:prefecture_name,:condition_id,:postage_payer,:preparation_day,images_attributes:{url:[]}).merge(seller_id:current_user.id)
  end
end
