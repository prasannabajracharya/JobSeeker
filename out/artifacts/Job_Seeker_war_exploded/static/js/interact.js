/**
 * Created by prasannabajracharya on 5/21/17.
 */
$(function () {

    $("#location-btn1").click(function () {

        var api = "http://api.openweathermap.org/data/2.5/weather?q=";

        var apiKey = "&appid=5039f6a0d872c67ff627191515c6304e";

        var zipCode = $("#location-info").val();

        var url = api + zipCode + apiKey;

        console.log(url);

        console.log(zipCode);

        if (zipCode != "") {

            const initMap = data => {
                var lat;
                var lng;


                lat = data.coord.lat;
                lng = data.coord.lon;

                var weatherDesc = data.weather[0].description;
                var iconCode = data.weather[0].icon;
                var iconUrl = "http://openweathermap.org/img/w/" + iconCode + ".png";
                var temp = data.main.temp;
                var pressure = data.main.humidity;
                var city = data.name;

                $(".city").text(city);
                $(".type").text(weatherDesc);
                $(".degree").html(temp+"&#8457;");
                $(".weather-image").html("<img src='" + iconUrl + "'>");
                //
                // $(".weather").html("<img src='" + iconUrl + "'>" + "<div>" + weatherDesc + "</div>" + "<div>" + temp + "</div>" + "<div>" + pressure + "</div>" + "<div>" + city + "</div>");
                //

                console.log("Weather : " + weatherDesc);
                console.log("Temp : " + temp);
                console.log("Pressure : " + pressure);
                console.log("City : " + city);

                var coordinates = {lat, lng};

                const map = new google.maps.Map(document.getElementById('map'), {
                    center: coordinates,
                    zoom: 10
                });

                var marker = new google.maps.Marker({
                    position: coordinates,
                    map: map
                });
            };

            $.getJSON(url, initMap);

        } else {

            var lat;
            var lng;

            getLocation();

            function getLocation() {
                if (navigator.geolocation) {
                    navigator.geolocation.getCurrentPosition(showPosition);

                } else {
                    $("#map").HTML = "Geolocation is not supported by this browser.";
                }
            }

            function showPosition(position) {
                lat = position.coords.latitude;
                lng = position.coords.longitude;

                console.log("latitude : " + lat);
                console.log("Longitude : " + lng);

                var coordinates = {lat, lng};

                const map = new google.maps.Map(document.getElementById('map'), {
                    center: coordinates,
                    zoom: 10
                });

                var marker = new google.maps.Marker({
                    position: coordinates,
                    map: map
                });

            }

        }


    });

});