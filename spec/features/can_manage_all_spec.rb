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

   describe '#create' do
      let!(:fan){ FactoryGirl.create(:fan) }

      context 'User can create a dish' do
         it 'Create a dish by fan' do
            visit '/dishes'

            expect(page).to have_link 'Create a dish'

            click_on 'Create a dish'

            fill_in 'Email', with: 'robinhood@example.com'
            fill_in 'Password', with: '12345678'

            click_on 'Log in'

            expect(page).to have_content 'Create a Dish'

            fill_in 'Title', with: 'Bun thit nuong'
            fill_in 'Description', with: 'This is very delicious'
            fill_in 'Cost', with: 10
            fill_in 'Pax', with: 10

            click_on 'Create Dish'
            
            expect(page).to have_content 'Bun thit nuong'            

         end
      end
   end

end