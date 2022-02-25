require 'rails_helper'

RSpec.describe Charger, type: :poro do
  describe 'object' do
    it 'exists and has attributes' do
      data = {
              station_name: "16M BUILDING 16M B-1",
              access_days_time: "24 hours daily",
              fuel_type_code: "ELEC",
              city: "Denver",
              state: "CO",
              street_address: "1550 Market St",
              zip: "80202",
              country: "US",
              distance: 0.12268,
             }

      charger = Charger.new(data)
      
      expect(charger).to be_a(Charger)
      expect(charger).to have_attributes(name: '16M BUILDING 16M B-1')
      expect(charger).to have_attributes(access_times: '24 hours daily')
      expect(charger).to have_attributes(fuel_type: 'ELEC')
      expect(charger).to have_attributes(city: 'Denver')
      expect(charger).to have_attributes(state: 'CO')
      expect(charger).to have_attributes(street_address: '1550 Market St')
      expect(charger).to have_attributes(zip: '80202')
      expect(charger).to have_attributes(full_address: '1550 Market St, Denver, CO 80202')
      expect(charger).to have_attributes(distance: 0.12268)
    end
  end
end
