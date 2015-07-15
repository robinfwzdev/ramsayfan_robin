require 'rails_helper'

RSpec.describe "can manage all spec", :type => :feature do
   describe 'Search dishes' do
      let!(:pho_dish){ FactoryGirl.create(:dish, title: 'Pho ga') }
      let!(:lau_dish){ FactoryGirl.create(:dish, title: 'Lau ga') }

      it 'Search dishes by title' do
         visit '/dishes'

         fill_in :keyword, with: 'Pho'
         click_on 'Search'

         expect(page).to have_content 'Pho ga'
      end
   end
end