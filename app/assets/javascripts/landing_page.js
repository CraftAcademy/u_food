function initiateMap() {
    map = GMaps({
        div: '#map',
        zoom: 15,
        lat: 57.7089,
        lng: 11.9746
    });
    performGeolocation();
};

function performGeolocation() {
    var latitude;
    var longitude;
    var testing_env = document.getElementById('map').dataset.testEnv;
    if (testing_env === 'false') {
        GMaps.geolocate({
            success: function (position) {
                latitude = position.coords.latitude;
                longitude = position.coords.longitude;
                map.setCenter(latitude, longitude);
                map.addMarker({
                    lat: position.coords.latitude,
                    lng: position.coords.longitude,
                    title: 'You are here',
                    infoWindow: {
                        content: '<p>You are here!</p>'
                    }
                });
                displayRestaurantMarkers(map);
            },
            error: function (error) {
                alert('Geolocation failed: ' + error.message);
            },
            not_supported: function () {
                alert('Your browser does not support geolocation');
            }
        });


    } else {
        latitude = 59.334591;
        longitude = 18.063240;
        map.setCenter(latitude, longitude);
        map.addMarker({
            lat: latitude,
            lng: longitude,
            title: 'You are here',
            infoWindow: {
                content: '<p>You are here!</p>'
            }
        });
        displayRestaurantMarkers(map);
    }

}

function displayRestaurantMarkers(map) {
    var restaurants = JSON.parse(document.getElementById('restaurants_addresses').dataset.addresses);
    restaurants.forEach(function (restaurant) {
        console.log(restaurant);
        map.addMarker({
            lat: restaurant.latitude,
            lng: restaurant.longitude,
            title: restaurant.name,
            infoWindow: {
                content: 'Restaurant ' + restaurant.name
            }
        });
    });
}