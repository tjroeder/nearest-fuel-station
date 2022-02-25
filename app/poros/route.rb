class Route
  attr_reader :time,
              :maneuvers,
              :directions

  def initialize(data)
    @time = data[:time]
    @maneuvers = data[:maneuvers]
    @directions = @maneuvers.map { |n| n[:narrative] }
  end
end
