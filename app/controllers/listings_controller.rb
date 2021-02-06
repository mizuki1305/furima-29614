class ListingsController < ApplicationController

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def create
    Listing.create(listing_params)
  end

  private
  def listing_params
    params.require(:listing).premit(:product, :text, :category_id, :state_id, :burden_id, :area_id, :day_id, :price, :user)
  end
end
