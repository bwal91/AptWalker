

function initMap() {
        var home = {lat: 47.676780, lng: -122.127355};
        // var dojo = {lat: 47.609811, lng: -122.196569}
        var map = new google.maps.Map(document.getElementById('map'), {
          zoom: 11,
          center: home
        });

        var marker;
        var contentString;
        var infowindow = new google.maps.InfoWindow();
        for (var i=0; i < locations.length; i++){
          marker = new google.maps.Marker({
            position: new google.maps.LatLng(locations[i]['lat'], locations[i]['lng']),
            map: map,
          });
          marker.content = '<div id="score">' +
          '<h1>' +
          locations[i]['title'] +
          '</h1>' +
          '<br>'+
          '<h3> Walk Score: ' +
          locations[i]['walk'] +
          '<br>' +
          locations[i]['desc']+
          '</h3>' +
          '</div>';
        google.maps.event.addListener(marker, 'click', function(){
          infowindow.setContent(this.content);
          infowindow.open(this.getMap(), this);
        });
        };


        var geocoder = new google.maps.Geocoder();

        document.getElementById('submit').addEventListener('click', function() {
          geocodeAddress(geocoder, map);
        });
      }

      function geocodeAddress(geocoder, resultsMap) {
        var address = document.getElementById('address').value;
        var title = document.getElementById('title').value;
        geocoder.geocode({'address': address}, function(results, status) {
          if (status === 'OK') {
            resultsMap.setCenter(results[0].geometry.location);
            var marker = new google.maps.Marker({
              map: resultsMap,
              position: results[0].geometry.location
            });
            $.ajax({
              url: '/map', 
              method: 'post',
              data: {address: results[0].formatted_address,
                    lat: results[0].geometry.location.lat(),
                    lng: results[0].geometry.location.lng(),
                    title: title
              },
              success: function(res){
                console.log("Yes")
              },
            })
          } else {
            alert('Geocode was not successful for the following reason: ' + status);
          }
        });
      };