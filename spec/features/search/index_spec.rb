require 'rails_helper'

RSpec.describe 'Search Index Page', type: :feature do
  context 'as a user' do
    describe 'viewable elements' do
      it 'displays starting location header' do
        visit root_path
        select 'Turing', from: 'location'
        click_button 'Find Nearest Station'

        expect(page).to have_css('h1', text: 'Nearest Charger to 1331 17th St, Unit LL100, Denver, CO 80202')
      end

      it 'displays charger information' do
        visit root_path
        select 'Turing', from: 'location'
        click_button 'Find Nearest Station'
        
        expect(page).to have_content('Name: 16M BUILDING 16M B-1')
        expect(page).to have_content('Address: 1550 Market St, Denver, CO 80202')
        expect(page).to have_content('Fuel Type: ELEC')
        expect(page).to have_content('Access Times: 24 hours daily')
        expect(page).to have_content('Distance to charger: 0.1 mi.')
        expect(page).to have_content('Travel time to charger: 1 minute')
      end
      
      it 'displays the route to the charger location' do
        visit root_path
        select 'Turing', from: 'location'
        click_button 'Find Nearest Station'

        expect(page).to have_content('Start out going southeast on 17th St toward Larimer St/CO-33.')
        expect(page).to have_content('Turn right onto Larimer St/CO-33.')
        expect(page).to have_content('Turn right onto 15th St/CO-33.')
        expect(page).to have_content('Turn right onto Market St.')
        expect(page).to have_content('1550 MARKET ST is on the right.')
      end
    end
  end
end