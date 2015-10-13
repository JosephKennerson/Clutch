$(document).ready(function(){
  console.log("hi from events.js")

  L.mapbox.accessToken = 'pk.eyJ1IjoieGFuZGVycHNvbiIsImEiOiJjaWZvcml2YjU1Mnc2c3ZrcTlibmxjcXJuIn0.M7QobcyaQENSoLb86fvvug';
  var map = L.mapbox.map('map', 'xanderpson.nmn4lji0').setView([39.7,-104.50], 7);

  map.featureLayer.on("ready", function(event) {
    getEvents(map);
  });

  // var markerLayer = L.mapbox.featureLayer().addTo(map);

  // var geojson = {
  //   "type": "Feature",
  //   "geometry": {
  //     "type": "Point",
  //     "coordinates": [-104.6, 39.67]
  //    },
  //   "properties": {
  //     "name": "Denver, Colorado",
  //     "marker-color": "#fffaaa",
  //     "marker-size": "small",
  //     "marker-symbol": "circle"
  //   }
  // };

  // markerLayer.setGeoJSON(geojson);

});

function getEvents(map) {
  var $loading_wheel = $("spinning-wheel")
  $loading_wheel.show();
  $.ajax({
    dataType: 'text',
    url: '/events/map.json',
    success: function(events) {
      $loading_wheel.hide();
      var geojson = $.parseJSON(events);
      map.featureLayer.setGeoJSON({
        type: "FeatureCollection",
        features: geojson
      });
      addEventPopups(map);
    },
    error: function() {
      $loading_wheel.hide();
      alert("Could not load the events");
    }
  });
}

function addEventPopups(map) {
  map.featureLayer.on("layeradd", function(e){
    var marker = e.layer;
    var properties = marker.feature.properties;
    var popupContent = 'div class="marker-popup">' + '<h3>' + properties.title + '</h3>' +
                        '<h4>' + properties.address + '</h4>' + '</div>';
    marker.bindPopup(popupContent, {closeButton: false, minWidth: 300});
  });
}