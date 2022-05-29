// Note: This example requires that you consent to location sharing when
// prompted by your browser. If you see the error "The Geolocation service
// failed.", it means you probably did not give permission for the browser to
// locate you.
let map, infoWindow;

function initMap() {
  map = new google.maps.Map(document.getElementById("map"), {
    center: { lat: 20.5937, lng: 78.9629 },
    zoom: 10,
  });
  infoWindow = new google.maps.InfoWindow();

  const locationButton = document.createElement("button");
  
  locationButton.textContent = "Pan to Current Location";
  locationButton.classList.add("custom-map-control-button");
  map.controls[google.maps.ControlPosition.TOP_CENTER].push(locationButton);
  locationButton.addEventListener("click", () => {
    // Try HTML5 geolocation.
    if (navigator.geolocation) {
      navigator.geolocation.getCurrentPosition(
        (position) => {
            
          const pos = {
            lat: position.coords.latitude,
            lng: position.coords.longitude,
            
          };
          document.getElementById("demo").innerHTML = +position.coords.latitude; 
          document.getElementById("demo1").innerHTML = +position.coords.longitude; 
         
         
          infoWindow.setPosition(pos);
          infoWindow.setContent("Location found.");
          
          infoWindow.open(map);
          map.setCenter(pos);
          
          
          
        },
        () => {
          handleLocationError(true, infoWindow, map.getCenter());
          
        }
        
      );
    } else {
      // Browser doesn't support Geolocation
      handleLocationError(false, infoWindow, map.getCenter());
    }
  });
}

function handleLocationError(browserHasGeolocation, infoWindow, pos) {
  infoWindow.setPosition(pos);
  infoWindow.setContent(
    browserHasGeolocation
      ? "Error: The Geolocation service failed."
      : "Error: Your browser doesn't support geolocation."
  );
  infoWindow.open(map);
}

window.initMap = initMap;

// if (navigator.geolocation) {
//     navigator.geolocation.getCurrentPosition(function (p) {
//         var LatLng = new google.maps.LatLng(p.coords.latitude, p.coords.longitude);
//         var mapOptions = {
//             center: LatLng,
//             zoom: 13,
//             mapTypeId: google.maps.MapTypeId.ROADMAP
//         };
//         var map = new google.maps.Map(document.getElementById("demo").innerHTML =""+p.coords.latitude+","+p.coords.longitude+"", mapOptions);
//         var marker = new google.maps.Marker({
//             position: LatLng,
//             map: map,
//             title: "<div style = 'height:60px;width:200px'><b>Your location:</b><br />Latitude: " + p.coords.latitude + "<br />Longitude: " + p.coords.longitude
//         });
//         google.maps.event.addListener(marker, "click", function (e) {
//             var infoWindow = new google.maps.InfoWindow();
//             infoWindow.setContent(marker.title);
//             infoWindow.open(map, marker);
//         });
//     });
// } else {
//     alert('Geo Location feature is not supported in this browser.');
// }


