class ListingsController < ApplicationController
    before_action :authenticate_user!, only: [:new, :create, :update]
    before_action :set_listing, only: [:show, :edit, :update]

  def index
    @listings = Listing.all
  end

  def new
    @listing = Listing.new
  end

  def show
  end

  def edit
    if current_user.id != @listing.user.id
      return redirect_to root_path
    end
  end

  def update
    @listing.update(listing_params)
    if @listing.valid?
      redirect_to :root, notice:'User was successfully created'
    else
      render :edit
    end
  end

  def create
    @listing = Listing.new(listing_params)
    if @listing.save
      redirect_to :root, notice:'User was successfully created'
    else
      render :new
    end
  end

  def set_listing
    @listing = Listing.find(params[:id])
  end

  private
  def listing_params
    params.require(:listing).permit(:product, :text, :category_id, :state_id, :burden_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end

end
