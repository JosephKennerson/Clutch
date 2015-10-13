class GeojsonBuilder < ActiveRecord::Base
	  def self.build_event(event)
     {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [rand(-124.58...-72.46), rand(32.71...48.81)]
      },
      properties: {
        title: event.name,
        address: event.address_line_1,
        :"marker-color" => "#FFFFFF",
        :"marker-symbol" => "circle",
        :"marker-size" => "medium",
      }
    }
  end
end