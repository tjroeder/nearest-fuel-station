# frozen_string_literal: true

require 'rails_helper'

RSpec.describe SearchService, type: :service do
  context 'class methods' do
    describe '::mapquest_conn' do
      it 'returns Faraday connection' do
        mapquest = SearchService.mapquest_conn

        expect(mapquest).to be_a(Faraday::Connection)
      end
    end

    describe '::nrel_conn' do
      it 'returns Faraday connection' do
        nrel = SearchService.nrel_conn

        expect(nrel).to be_a(Faraday::Connection)
      end
    end

    describe '::search_station' do
      it 'returns hash closest charger info' do
        charger = SearchService.search_station('1331 17th St, Unit LL100, Denver, CO 80202', 'ELEC', 1)

        expect(charger[:fuel_stations].first[:state]).to eq('CO')
        expect(charger).to be_a(Hash)
        expect(charger[:fuel_stations]).to be_a(Array)
      end

      it 'returns array of 1 charger' do
        charger = SearchService.search_station('1331 17th St, Unit LL100, Denver, CO 80202', 'ELEC', 1)

        expect(charger[:fuel_stations].count).to eq(1)
      end
    end

    describe '::search_route' do
      it 'returns hash of route data' do
        route = SearchService.search_route('1331 17th St, Unit LL100, Denver, CO 80202', '1550 Market St, Denver, CO 80202')

        expect(route[:route]).to be_a(Hash)
      end
    end
  end
end
