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
    @restaurant = Restaurant.find(params[:id])
  end

  def create
    restaurant = Restaurant.new(restaurant_params)
    restaurant.save!
    redirect_to restaurants_url, notice: "#{Restaurant.model_name.human}「#{restaurant.name}」を登録しました。"
  end

  def update
    restaurant = Restaurant.find(params[:id])
    restaurant.update!(restaurant_params)
    redirect_to restaurants_url, notice: "#{Restaurant.model_name.human}「#{restaurant.name}」を更新しました。"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :url, :note)
  end
end
