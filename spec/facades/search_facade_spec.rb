require 'rails_helper'

RSpec.describe SearchFacade, type: :facade do
  context 'class methods' do
    describe '::closest_alt_fuel_info' do
      it 'should return alt fuel station info' do
        charger_info= SearchFacade.closest_charger_info('1331 17th St, Unit LL100, Denver, CO 80202')

        expect(charger_info.first).to be_a(Charger)
        expect(charger_info.last).to be_a(Route)
      end
    end
  end
end
