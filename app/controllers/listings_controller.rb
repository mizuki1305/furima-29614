class ListingsController < ApplicationController
    before_action :authenticate_user!, except: [:index, :show]
    before_action :set_listing, only: [:show, :edit, :update, :destroy]
    before_action :set_list, only: [:edit, :update]

  def index
    @listings = Listing.includes(:user).order("created_at DESC")
  end

  def new
    @listing = Listing.new
  end

  def show
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      return redirect_to listing_path
    else
      render :edit
    end
  end
  
  def destroy
    if @listing.destroy
      redirect_to root_path
    else
      render :show
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
  
  private
  def listing_params
    params.require(:listing).permit(:product, :text, :category_id, :state_id, :burden_id, :area_id, :day_id, :price, :image).merge(user_id: current_user.id)
  end
  
  def set_listing
    @listing = Listing.find(params[:id])
  end
  
  def set_list
    if @listing.user.id != current_user.id
      redirect_to root_path
    end
  end
end
