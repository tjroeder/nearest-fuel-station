# frozen_string_literal: true

class SearchService
  def self.search_route(from, to)
    mq_resp = mapquest_conn.get('route', { from: from, to: to })
    JSON.parse(mq_resp.body, symbolize_names: true)
  end
  
  def self.search_station(location, fuel_type, limit)
    nrel_resp = nrel_conn.get('nearest.json', { location: location, fuel_type: fuel_type, limit: limit })
    JSON.parse(nrel_resp.body, symbolize_names: true)
  end

  def self.mapquest_conn
    url = 'http://www.mapquestapi.com/directions/v2/'
    Faraday.new(url: url, params: { key: ENV['mapquest_api_key'] })
  end

  def self.nrel_conn
    url = 'https://developer.nrel.gov/api/alt-fuel-stations/v1/'
    Faraday.new(url: url, params: { api_key: ENV['nrel_api_key'] })
  end
end
