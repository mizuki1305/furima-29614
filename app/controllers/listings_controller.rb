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
  end

  def update
    if current_user.id == @listing.user.id
      @listing.update(listing_params)
      return redirect_to listing_path if @listing.valid?
        render :edit
    else
      redirect_to root_path
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
