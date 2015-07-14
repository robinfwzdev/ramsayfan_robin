require 'rails_helper'

RSpec.describe DishesController, type: :controller do
   describe "#index" do
      let!(:dishes){ FactoryGirl.create_list(:dish, 2) }

      it "check list dish" do
         get :index
         expect(assigns(:dishes).size).to eq dishes.size
      end
   end

   describe '#show' do  
      let!(:dish){ FactoryGirl.create(:dish) }  

      it 'displays a dish' do
         get :show, id: dish.id
         expect(assigns(:dish).id).to eq dish.id
      end
   end

end