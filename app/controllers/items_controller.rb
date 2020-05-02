class ItemsController < ApplicationController
  def index
  end

  def new
    @item = Item.new
    @item.images.new
  end

  def create
    binding.pry
    Item.create(item_params)
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
    params.require(:item).permit(:name,:price,:introduction,images_attributes:{url: []})
  end
end
