var myMaps = myMaps || {};

myMaps.load = function() {
  var mapOptions = {
    center: new google.maps.LatLng(51.5, -0.1),
    zoom: 14,
    streetViewControl: false,
    mapTypeControl: false
  };

  var map = new google.maps.Map(document.getElementById("map_canvas"), mapOptions);
  myMaps.addMarkerFromGeoCode(map);
}

myMaps.addMarker = function(map) {
  var position = new google.maps.LatLng (51.522, -0.1095);
  var marker = new google.maps.Marker({
    position: position,
    map: map,
    title: "GA London"
  });
  map.setCenter(result[0].geometry.location);
}

myMaps.addMarkerFromGeoCode = function(map) {
  var geocoder = new google.maps.Geocoder();
  var geocoderResultCallback = function(result, status, title) {
    if (status == google.maps.GeocoderStatus.OK) {
      console.log(result);
      var marker = new google.maps.Marker({
        position: result[0].geometry.location,
        map: map,
        title: title
      })
      map.setCenter(result[0].geometry.location)
    }
  };
  $('address').each(function(i, el) {
    geocoder.geocode({ address: $(el).text() }, function(a, b) { geocoderResultCallback(a, b, $(el).text()); });
  }); 
}

google.maps.event.addDomListener(window, 'load', myMaps.load);