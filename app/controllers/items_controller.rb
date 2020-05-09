class ItemsController < ApplicationController
  before_action :set_item,    only: [:show,:destroy]
  before_action :set_category, only:[:index,:new,:edit]

  def index
    @blands = Item.includes(:images).where.not(bland: "").where(buyer_id: nil).order("created_at DESC").limit(3)
    @newitems = Item.includes(:images).where(buyer_id: nil).order("created_at DESC").limit(3)
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
    @prefectures = Prefecture.all
  end

  def update
  end

  def destroy
    if @item.destroy 
       redirect_to root_path
    else
      render :show
    end
  end

  def get_category_child
    @category_child = Category.find(params[:parent_id]).children
    render json: @category_child
  end

  def get_category_grandchild
    @category_grandchild = Category.find(params[:child_id]).children
    render json: @category_grandchild
  end

 private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(:name,:price,:introduction,:bland,:prefecture_name,:condition_id,
    :postage_payer,:preparation_day,:category_id,images_attributes:[:url]).merge(seller_id:current_user.id)
  end
  
  def set_category
    @category_parent = Category.where(ancestry: nil)
  end
end
