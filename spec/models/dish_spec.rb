require "rails_helper"

RSpec.describe Dish, type: :model do
   context 'Validation' do
      it { should validate_presence_of(:title) }
      it { should validate_presence_of(:description) }
      it { should validate_numericality_of(:cost).is_greater_than(0) }
      it { should validate_numericality_of(:pax).is_greater_than(0) }
      it { should belong_to :fan}
   end

   describe 'Search' do
      let!(:pho_ga) { FactoryGirl.create(:dish, title: 'Pho ga') }
      let!(:com_tam){ FactoryGirl.create(:dish, title: 'Com tam') }

      it 'Search dishes by title' do
         results = Dish.search_keyword('pho')
         expect(results.first.title).to eq pho_ga.title
         expect(results.first.title).not_to eq com_tam.title
      end
   end

   describe 'Get dish by fan' do      
      let!(:robin_dish) { FactoryGirl.create(:dish, fan: FactoryGirl.create(:fan)) }
      let!(:steven_dish) { FactoryGirl.create(:dish, fan: FactoryGirl.create(:fan)) }

      it 'get dishes by fan_id' do
         results = Dish.getDishesByFan(robin_dish.fan.id)
         expect(results).to include robin_dish
         expect(results).not_to include steven_dish
      end
   end

   describe 'Published' do
      let!(:published_dish)  { FactoryGirl.create(:dish, published: true) }
      let!(:unpublished_dish){ FactoryGirl.create(:dish, published: false) }

      it 'Search dishes by title' do
         results = Dish.published
         expect(results).to include published_dish
         expect(results).not_to include unpublished_dish
      end
   end

end