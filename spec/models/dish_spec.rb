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

end