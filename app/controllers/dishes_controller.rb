class DishesController < ApplicationController

   before_filter :authenticate_fan!, only: :new

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

   private

   def dish_id
      params.require(:id)
   end

   def keyword
      params[:keyword]
   end
end