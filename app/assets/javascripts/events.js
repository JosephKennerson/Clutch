$(document).ready(function(){

  L.mapbox.accessToken = 'pk.eyJ1IjoieGFuZGVycHNvbiIsImEiOiJjaWZvcml2YjU1Mnc2c3ZrcTlibmxjcXJuIn0.M7QobcyaQENSoLb86fvvug';
  var map = L.mapbox.map('map', 'xanderpson.nmn4lji0').setView([37.7846334, -90.3974137], 5),
      filters = document.getElementById('filters');

  map.featureLayer.on("ready", function(event) {
    getEvents(map);
    getFilters(map);
    getClusters(map);
  });

  map.scrollWheelZoom.disable();
});

function getEvents(map) {
  $.ajax({
    dataType: 'text',
    url: '/events/map.json',
    success: function(events) {
      var geojson = $.parseJSON(events);

      addEventPopups(map);

      map.featureLayer.setGeoJSON({
        type: "FeatureCollection",
        features: geojson
      });
    },
    error: function() {
      alert("Could not load the events");
    }
  });
}

function addEventPopups(map) {
  map.featureLayer.on('layeradd', function(e){
    var marker = e.layer,
        properties = marker.feature.properties,
        popupContent = '<button class="trigger">Say hi</button>' +
                       '<a target="_blank" class="popup" href="' + properties.url + '">' +
                       '<img src="' + properties.image + '" />' +
                         properties.city +
                       '</a>' + '</br>' + '<a href="localhost:3000/events/' + properties.showPage + '">' + properties.title + '</a>'+ '</br>' + properties.address;
    marker.bindPopup(popupContent, {closeButton: false, minWidth: 320});
  });
  $('#map').on('click', '.trigger', function() {
    alert('Hello from Toronto!');
  });
}

function getFilters(map) {
  $.ajax({
    dataType: 'text',
    url: '/events/map.json',
    success: function(events) {
      var geojson = $.parseJSON(events);

      var typesObj = {}, types = [];
      var features = map.featureLayer.getGeoJSON().features;
      for (var i = 0; i < features.length; i++) {
        typesObj[features[i].properties['marker-symbol']] = true;
      }
      for (var k in typesObj) types.push(k);

      var checkboxes = [];
      // Create a filter interface.
      for (var i = 0; i < types.length; i++) {
        // Create an an input checkbox and label inside.
        var item = filters.appendChild(document.createElement('div'));
        var checkbox = item.appendChild(document.createElement('input'));
        var label = item.appendChild(document.createElement('label'));
        checkbox.type = 'checkbox';
        checkbox.id = types[i];
        checkbox.checked = true;
        // create a label to the right of the checkbox with explanatory text
        label.innerHTML = types[i];
        label.setAttribute('for', types[i]);
        // Whenever a person clicks on this checkbox, call the update().
        checkbox.addEventListener('change', update);
        checkboxes.push(checkbox);
      }

      function update() {
      var enabled = {};
      // Run through each checkbox and record whether it is checked. If it is,
      // add it to the object of types to display, otherwise do not.
      for (var i = 0; i < checkboxes.length; i++) {
        if (checkboxes[i].checked) enabled[checkboxes[i].id] = true;
      }
      map.featureLayer.setFilter(function(feature) {
        // If this symbol is in the list, return true. if not, return false.
        // The 'in' operator in javascript does exactly that: given a string
        // or number, it says if that is in a object.
        // 2 in { 2: true } // true
        // 2 in { } // false
        return (feature.properties['marker-symbol'] in enabled);
      });
    }
      
    },
    error: function() {
      alert("Could not load the events");
    }
  });
}

function getClusters(map) {
  $.ajax({
    dataType: 'text',
    url: '/events/map.json',
    success: function(events) {
      var geojson = $.parseJSON(events);
      var clusterGroup = new L.MarkerClusterGroup();
      map.featureLayer.eachLayer(function(layer) {
          clusterGroup.addLayer(layer);
      });
      map.addLayer(clusterGroup);
    },
    error: function() {
      alert("Could not load the events");
    }
  });
}