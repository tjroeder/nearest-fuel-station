class Charger
  attr_reader :name,
              :access_times,
              :fuel_type,
              :street_address,
              :city,
              :state,
              :zip,
              :full_address,
              :distance

  def initialize(data)
    @name = data[:station_name]
    @access_times = data[:access_days_time]
    @fuel_type = data[:fuel_type_code]
    @street_address = data[:street_address]
    @city = data[:city]
    @state = data[:state]
    @zip = data[:zip]
    @full_address = "#{@street_address}, #{@city}, #{state} #{zip}"
    @distance = data[:distance]
  end
end
