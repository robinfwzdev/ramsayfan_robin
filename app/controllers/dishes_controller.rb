class DishesController < ApplicationController

   before_filter :authenticate_fan!, only: [:new, :create, :edit, :update]

   def index
      if keyword.blank?
         @dishes = Dish.published.approved
      else
         @dishes = Dish.search_keyword(keyword).published.approved
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

    def edit
      @dish = Dish.find(dish_id)
      render :new
   end

   def update
      @dish = Dish.find(dish_id)
      if @dish.update(dish_params)
         redirect_to dishes_url, notice: "you have successfully updated a dish!" 
      else
         flash.now[:error] = "There is an error to update your dish"
         render :new
      end
   end

   def mydishes
      @dishes = Dish.getDishesByFan(current_fan.id) if current_fan.present?
   end

   def published
      @dish = Dish.find(dish_id)
      @dish.published = true

      if @dish.save
         flash[:notice] = "You have published dish successfully"
      else
         flash.now[:error] = "There is an error to published your dish"
      end
      redirect_to dishes_mydishes_dishes_url
   end

   def unpublished
      @dish = Dish.find(dish_id)
      @dish.published = false

      if @dish.save
         flash[:notice] = "You have unpublished dish successfully"
      else
         flash.now[:error] = "There is an error to unpublished your dish"
      end
      redirect_to dishes_mydishes_dishes_url
   end

   def upvote
      @dish = Dish.find(dish_id)
      @dish.upvote_by current_fan
      redirect_to :back
   end

   def downvote
      @dish = Dish.find(dish_id)
      @dish.downvote_by current_fan
      redirect_to :back
   end


   private

   def dish_id
      params.require(:id)
   end

   def keyword
      params[:keyword]
   end

   def dish_params
      params.require(:dish).permit(:title, :description, :cost, :pax, :vegetarian, :fan_id, :published).merge(fan_id: current_fan.id)
   end

end