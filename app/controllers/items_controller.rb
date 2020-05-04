class ItemsController < ApplicationController
  def index
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
    params.require(:item).permit(:name,:price,:introduction,:prefecture_id,images_attributes:{url:[]})
  end
end
