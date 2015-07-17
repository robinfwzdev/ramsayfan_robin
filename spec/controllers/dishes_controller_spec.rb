require 'rails_helper'

RSpec.describe DishesController, type: :controller do
   describe "#index" do
      let!(:dishes){ FactoryGirl.create_list(:dish, 2) }

      it "check list dish" do
         get :index
         expect(assigns(:dishes).size).to eq dishes.size
      end

      let!(:dish_published_and_approved) {FactoryGirl.create(:dish, approved: true)}
      let!(:dish_approved_not_published) {FactoryGirl.create(:dish, published: false)}

      it "only show dishes is published and approved" do 
         get :index
         expect(assigns(:dishes).first).to eq dish_published_and_approved
      end
   end

   describe '#show' do  
      let!(:dish){ FactoryGirl.create(:dish) }  

      it 'displays a dish' do
         get :show, id: dish.id
         expect(assigns(:dish).id).to eq dish.id
      end
   end

   describe '#new' do
      let!(:fan){ FactoryGirl.create(:fan) }

      before :each do
         sign_in fan
      end

      it 'assigns an empty dish instance' do
         get :new
         expect(assigns(:dish)).to be_a Dish
      end
   end

   describe '#create' do
      def do_request
         post :create, dish: params
      end

      let!(:fan){ FactoryGirl.create(:fan) }

      before do
         sign_in fan
      end

      context "Success" do
         let(:params){ FactoryGirl.attributes_for(:dish, fan_id: fan) }

         it 'saves a dish' do
            expect{ do_request }.to change(Dish, :count).by(1)
         end

         it 'redirects to index on success' do
            do_request
            expect(response).to redirect_to dishes_url
         end
      end

      context 'Failure' do
         let(:params){ FactoryGirl.attributes_for(:dish, title: '', fan_id: fan) }

         it 'renders new on failure' do 
            do_request
            expect(response).to render_template :new
         end
      end
   end

   describe '#edit' do
      let!(:fan){ FactoryGirl.create(:fan) }
      let!(:dish){ FactoryGirl.create(:dish, fan: fan) }

      before do
         sign_in fan
      end

      it 'assigns a dish instance' do
         get :edit, id: dish.id
         expect(assigns(:dish).id).to eq dish.id
      end
   end

   describe '#update' do
      let!(:fan){ FactoryGirl.create(:fan) }
      let!(:dish){ FactoryGirl.create(:dish, fan: fan) }

      before do
         sign_in fan
      end

      def do_request
         patch :update, id: dish.id, dish: params
      end

      context "Success" do
         let(:params){ FactoryGirl.attributes_for(:dish, title: "com ga xoi mo", fan_id: fan) }
         
         it 'updates a dish' do
            do_request
            expect(dish.reload.title).to eq params[:title]
            expect(response).to redirect_to dishes_url
         end
      end

      context 'Failure' do
         let(:params){ FactoryGirl.attributes_for(:dish, title: "") }

         it 'renders new on failure' do 
            do_request
            expect(response).to render_template :new
         end
      end
   end

   describe "#mydishes" do
      let!(:fan){ FactoryGirl.create(:fan) }
      let!(:dishes){ FactoryGirl.create_list(:dish, 2, fan: fan) }

       before do
         sign_in fan
      end
      
      it "check list dish" do
         get :mydishes
         expect(assigns(:dishes).size).to eq dishes.size
      end
   end

   describe '#published' do  
      let!(:dish){ FactoryGirl.create(:dish) }  

      it 'displays a dish' do
         get :published, id: dish.id
         expect(assigns(:dish).published).to eq true
      end
   end

   describe '#unpublished' do  
      let!(:dish){ FactoryGirl.create(:dish, published: true) }  

      it 'displays a dish' do
         get :unpublished, id: dish.id
         expect(assigns(:dish).published).to eq false
      end
   end

end