class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    @listing = Listing.create(listing_params)
    redirect_to root_path
    # redirect_to / render
  end

  private
  def listing_params
    params.require(:listing).permit(:product, :text, :category_id, :state_id, :burden_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

end
