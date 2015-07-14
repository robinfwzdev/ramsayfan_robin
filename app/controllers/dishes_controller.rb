class DishesController < ApplicationController

   before_filter :authenticate_fan!, only: [:new, :create]

   def index
      if keyword.blank?
         @dishes = Dish.all
      else
         @dishes = Dish.search_keyword(keyword)
      end
   end

   def show
      @dish = Dish.find(dish_id)
   end

   def new
      @dish = Dish.new
   end

   def create
      @dish = Dish.new(dish_params)
      if @dish.save
         redirect_to dishes_url, notice: "you have successfully created a dish!"             
      else
         flash.now[:error] = "There is an error to create your dish"
         render :new
      end
   end

   private

   def dish_id
      params.require(:id)
   end

   def keyword
      params[:keyword]
   end

   def dish_params
      params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian).merge(fan_id: current_fan.id)
   end

end