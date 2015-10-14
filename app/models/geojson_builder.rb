class GeojsonBuilder < ActiveRecord::Base
	  def self.build_event(event)
     {
      type: "Feature",
      geometry: {
        type: "Point",
        coordinates: [event.longitude, event.latitude]
        # coordinates: [rand(-124.58...-72.46), rand(32.71...48.81)]
      },
      properties: {
        title: event.name,
        address: event.address_line_1,
        showPage: event.id,
        image: "https://upload.wikimedia.org/wikipedia/commons/thumb/e/ef/Cherry_Blossoms_and_Washington_Monument.jpg/320px-Cherry_Blossoms_and_Washington_Monument.jpg",
        url: "https://en.wikipedia.org/wiki/Washington,_D.C.",
        :"marker-color" => "#FFFFFF",
        :"marker-symbol" => ["playground", "entrance", "heart", "london-underground", "minefield", "rail-underground", "rail-above", "camera", "laundry", "car", "suitcase", "hairdresser", "chemist", "mobilephone", "scooter", "gift", "ice-cream", "dentist", "aerialway"].sample,
        :"marker-size" => "medium",
        city: "Washington, D.C."
      }
    }
  end
end

# [ "circle-stroked", "circle", "square-stroked", "square", "triangle-stroked", "triangle", "star-stroked", "star", "cross", "marker-stroked", "marker", "religious-jewish", "religious-christian", "religious-muslim", "cemetery", "rocket", "airport", "heliport", "rail", "rail-metro", "rail-light", "bus", "fuel", "parking", "parking-garage", "airfield", "roadblock", "ferry", "harbor", "bicycle", "park", "park2", "museum", "lodging", "monument", "zoo", "garden", "campsite", "theatre", "art-gallery", "pitch", "soccer", "america-football", "tennis", "basketball", "baseball", "golf", "swimming", "cricket", "skiing", "school", "college", "library", "post", "fire-station", "town-hall", "police", "prison", "embassy", "beer", "restaurant", "cafe", "shop", "fast-food", "bar", "bank", "grocery", "cinema", "pharmacy", "hospital", "danger", "industrial", "warehouse", "commercial", "building", "place-of-worship", "alcohol-shop", "logging", "oil-well", "slaughterhouse", "dam", "water", "wetland", "disability", "telephone", "emergency-telephone", "toilets", "waste-basket", "music", "land-use", "city", "town", "village", "farm", "bakery", "dog-park", "lighthouse", "clothing-store", "polling-place", "playground", "entrance", "heart", "london-underground", "minefield", "rail-underground", "rail-above", "camera", "laundry", "car", "suitcase", "hairdresser", "chemist", "mobilephone", "scooter", "gift", "ice-cream", "dentist", “aerialway"]