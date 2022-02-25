require 'rails_helper'

RSpec.describe Route, type: :poro do
  describe 'object' do
    it 'exists and has attributes' do
      data = {
              time: 60,
              maneuvers: [
                          { narrative: "Start out going southeast on 17th St toward Larimer St/CO-33." },
                          { narrative: "Turn right onto Larimer St/CO-33." },
                          { narrative: "Turn right onto 15th St/CO-33." },
                          { narrative: "Turn right onto Market St." },
                          { narrative: "1550 MARKET ST is on the right." }
                          ]
             }

      route = Route.new(data)
      
      expect(route).to be_a(Route)
      expect(route).to have_attributes(time: 60)
      expect(route).to have_attributes(maneuvers: 
        [
        { narrative: "Start out going southeast on 17th St toward Larimer St/CO-33." },
        { narrative: "Turn right onto Larimer St/CO-33." },
        { narrative: "Turn right onto 15th St/CO-33." },
        { narrative: "Turn right onto Market St." },
        { narrative: "1550 MARKET ST is on the right." }
        ]
      )
      expect(route).to have_attributes(directions: ["Start out going southeast on 17th St toward Larimer St/CO-33.", "Turn right onto Larimer St/CO-33.", "Turn right onto 15th St/CO-33.", "Turn right onto Market St.", "1550 MARKET ST is on the right."])
    end
  end
end
