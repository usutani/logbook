class RestaurantsController < ApplicationController
  before_action :set_restaurant, only: [:show, :edit, :update, :destroy]

  def index
    @restaurants = current_user.restaurants
  end

  def show
  end

  def new
    @restaurant = Restaurant.new
  end

  def edit
  end

  def create
    @restaurant = current_user.restaurants.new(restaurant_params)

    if @restaurant.save
      redirect_to @restaurant, notice: "#{Restaurant.model_name.human}「#{@restaurant.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_url, notice: "#{Restaurant.model_name.human}「#{@restaurant.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    @restaurant.destroy
    redirect_to restaurants_url, notice: "#{Restaurant.model_name.human}「#{@restaurant.name}」を削除しました。"
  end

  private

  def set_restaurant
    @restaurant = current_user.restaurants.find(params[:id])
  end

  def restaurant_params
    params.require(:restaurant).permit(:name, :url, :note)
  end
end
