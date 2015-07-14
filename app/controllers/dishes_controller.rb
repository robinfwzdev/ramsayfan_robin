class DishesController < ApplicationController

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

   private

   def dish_id
      params.require(:id)
   end

   def keyword
      params[:keyword]
   end
end