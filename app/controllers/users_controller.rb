class UsersController < ApplicationController
  def show
    @blands = Item.includes(:images).where.not(bland: "").where(buyer_id: nil).order("created_at DESC").limit(3)
    @newitems = Item.includes(:images).where(buyer_id: nil).order("created_at DESC").limit(3)
  end
end
