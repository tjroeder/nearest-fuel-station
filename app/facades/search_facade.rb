class SearchFacade
  def self.closest_charger_info(location)
    charger_json = SearchService.search_station(location, 'ELEC', 1)
    charger = Charger.new(charger_json[:fuel_stations][0])

    route_json = SearchService.search_route(location, charger.full_address)
    route = Route.new(route_json[:route][:legs][0])
    [charger, route]
  end
end
