class ListingsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_listing, only: [:update, :basics, :description, :address, :price, :photos, :calendar, :bankaccount, :publish]
  
  def index
  end

  def show
    
  end

  def new
    @listing = current_user.listings.new
  end

  def create
    @listing = current_user.listings.new(listing_params)
    if @listing.save
      redirect_to manage_listing_basics_path(@listing),notice:"リスティングを作成・保存しました"
    else 
      render new_listing_path(@listing),notice:"リスティングを作成・保存できませんでした"
    end
  end

  def edit
  end

  def update
    if @listing.update(listing_params)
      redirect_back(fallback_location: root_path)
    end
  end
  
  def basics
  end
  
  def description
  end
  
  def address
  end

  def price
  end

  def photos
  end

  def calendar
  end

  def bankaccount
  end

  def publish
  end
  
  private
  
    def set_listing
      @listing = Listing.find(params[:id]) 
    end
  
    def listing_params
      params.require(:listing).permit(:home_type,:pet_type,:pet_size,:breeding_years,:price_pernight,:address,:listing_title,:listing_content,:action)
    end
end


