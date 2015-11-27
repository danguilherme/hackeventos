(function(window, document, undefined) {
  var THEME = {
    EVENT_COLOR_MEETUP: "#d00",
    EVENT_COLOR_EVENT: "#0d0",
    EVENT_COLOR_HACKATHON: "#00d"
  };

  var map;

  document.addEventListener('readystatechange', function() {
    if (document.readyState === 'complete') onReady()
  });


  function onReady() {
    console.log("onReady")
    var mapOptions = {
      center: new google.maps.LatLng(-23.6815315, -46.8754939),
      zoom: 5,
      mapTypeId: google.maps.MapTypeId.ROADMAP
    };

    map = new google.maps.Map(document.getElementById("map-canvas"), mapOptions);

    createMarkers(eventsList);
  }

  function createMarkers(events) {
    // geocoder = new google.maps.Geocoder();
    return events.map(function(event) {
      var pinConfig = createPin(THEME["EVENT_COLOR_" + event.type.toUpperCase()].replace("#", ""));

      var marker = new google.maps.Marker({
        map: map,
        draggable: false,
        icon: pinConfig.pin,
        shadow: pinConfig.shadow,
        position: {
          lat: event.location.lat,
          lng: event.location.lng
        }
      });

      google.maps.event.addListener(marker, 'click', (function(marker, event) {
        return function() {
          return onMarkerClick(marker, event);
        }
      })(marker, event));

      return marker;
    });
  }

  function createPin(color) {
    var pinColor = color;
    var pinImage = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|" + pinColor,
      new google.maps.Size(21, 34),
      new google.maps.Point(0, 0),
      new google.maps.Point(10, 34));
    var pinShadow = new google.maps.MarkerImage("http://chart.apis.google.com/chart?chst=d_map_pin_shadow",
      new google.maps.Size(40, 37),
      new google.maps.Point(0, 0),
      new google.maps.Point(12, 35));

    return {
      pin: pinImage,
      shadow: pinShadow
    };
  }

  function onMarkerClick(marker, event) {
    var infowindow = new google.maps.InfoWindow();
    infowindow.setContent(event.name);
    infowindow.open(map, marker);
  }

}(window, document));
