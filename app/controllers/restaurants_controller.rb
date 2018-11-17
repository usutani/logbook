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
    @restaurant = Restaurant.new(restaurant_params)
    if @restaurant.save
      redirect_to @restaurant, notice: "#{Restaurant.model_name.human}「#{@restaurant.name}」を登録しました。"
    else
      render :new
    end
  end

  def update
    @restaurant = Restaurant.find(params[:id])
    if @restaurant.update(restaurant_params)
      redirect_to restaurants_url, notice: "#{Restaurant.model_name.human}「#{@restaurant.name}」を更新しました。"
    else
      render :edit
    end
  end

  def destroy
    restaurant = Restaurant.find(params[:id])
    restaurant.destroy
    redirect_to restaurants_url, notice: "#{Restaurant.model_name.human}「#{restaurant.name}」を削除しました。"
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :url, :note)
  end
end
