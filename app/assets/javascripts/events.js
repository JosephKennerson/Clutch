$(document).ready(function(){
  L.mapbox.accessToken = 'pk.eyJ1IjoieGFuZGVycHNvbiIsImEiOiJjaWZvcml2YjU1Mnc2c3ZrcTlibmxjcXJuIn0.M7QobcyaQENSoLb86fvvug';
  var map = L.mapbox.map('map', 'xanderpson.nmn4lji0', {zoomControl: false}).setView([37.761688, -122.481385], 13),
      filters = document.getElementById('filters');
  L.control.zoomslider().addTo(map);

  map.featureLayer.on("ready", function(event) {
    getEvents(map);
    addEventPopups(map);
    addSidebar(map);
    event.target.on('mouseover', function(e){
      e.layer.openPopup();
    });
    map.scrollWheelZoom.disable();
  });

  $('#search-form').on('submit',function(e){
    e.preventDefault();
    var path = $(this).attr('action'),
        method = $(this).attr('method'),
        formData = $(this).serialize();
    $.ajax({
      url: path,
      type: method,
      data: formData,
      dataType: 'json'
    })
    .done(function(events){
      console.log(events)

      map.featureLayer.setGeoJSON({
        type: "FeatureCollection",
        features: events
      });
    })
    .fail(function(events){
      alert("Could not search");
    })    
  }); //search-form ajax

}); //document ready

function getEvents(map) {
  $.ajax({
    dataType: 'text',
    url: '/events/map.json',
    success: function(events) {
      var geojson = $.parseJSON(events);
      map.featureLayer.setGeoJSON({
        type: "FeatureCollection",
        features: geojson
      });
      addFilters(map);
      addClusters(map);
    },
    error: function() {
      alert("Could not load the events");
    }
  });
} //getEvents

function addEventPopups(map) {
  map.featureLayer.on('layeradd', function(e){
    var marker = e.layer,
        properties = marker.feature.properties,
        popupContent =      '<div><strong>Event Name</strong> : ' + properties.name + 
                            '<br/><strong>Description</strong> : ' + properties.description + '</div>'
                            // '<br/><strong>Category</strong> : ' + properties.category + 
                            // '<br/><strong>Current / Max</strong> : ' + properties.currently_attending + ' / ' + properties.max_size + 
                            // '<br/><strong>Host</strong> : ' + properties.host + 
                            // '<br/><strong>Location</strong> : ' + properties.public_location + 
                            // '<br/><strong>City</strong> : ' + properties.city + 
                            // '<br/><strong>State</strong> : ' + properties.state + 
                            // '<br/><strong>Zip</strong> : ' + properties.zip + 
                            // '<br/><strong>Date start</strong> : ' + properties.date_start + 
                            // '<br/><strong>Time start</strong> : ' + properties.time_start + 
                            // '<br/><strong>Date end</strong> : ' + properties.date_end + 
                            // '<br/><strong>Time end</strong> : ' + properties.time_end + '</div>'
  ;
    marker.bindPopup(popupContent, {closeButton: false, minWidth: 320});
  });
  // $('#map').on('click', '.trigger', function() {
  //   alert('Hello from Toronto!');
  // });
} //addEventPopups

function addFilters(map) {
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
}//addFilters

function addClusters(map) {
    var clusterGroup = new L.MarkerClusterGroup();
    map.featureLayer.eachLayer(function(layer) {
        clusterGroup.addLayer(layer);
    });
    map.addLayer(clusterGroup);
} //addClusters

function addSidebar(map) {
  map.featureLayer.on('mouseover',function(e) {
  $.ajax({
      dataType: 'text',
      url: '/events/' + e.layer.feature.properties.id,
      success: function(event) {
      info.innerHTML = event;
      },
      error: function() {
        alert("Could not add sidebar");
      }
    });
  });
} //addSidebar