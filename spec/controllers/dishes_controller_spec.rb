require 'rails_helper'

RSpec.describe DishesController, type: :controller do
   describe "#index" do
      let!(:dishes){ FactoryGirl.create_list(:dish, 2) }

      it "check list product" do
         get :index
         expect(assigns(:dishes).size).to eq dishes.size
      end
   end
end