class RestaurantsController < ApplicationController
  def index
    @restaurants = Restaurant.all
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save!
    redirect_to restaurants_url, notice: "#{Restaurant.model_name.human}「#{restaurant.name}」を登録しました。"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :url, :note)
  end
end
