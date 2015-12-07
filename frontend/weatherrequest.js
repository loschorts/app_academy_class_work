function WeatherRequest(locale, callback) {
    var xmlhttp = new XMLHttpRequest();

    xmlhttp.onreadystatechange = function() {
      if (xmlhttp.readyState === XMLHttpRequest.DONE ) {
       if(xmlhttp.status === 200){
           callback(xmlhttp.responseText);
        }
      }
    };

    var lat = locale[0].toString();
    var lon = locale[1].toString();

    var url = "http://api.openweathermap.org/data/2.5/weather?lat=" + lat + "&lon=" + lon + "&appid=645c5d39c7603f17e23fcaffcea1a3c1";
    xmlhttp.open("GET", url , true);

    xmlhttp.send();

}

module.exports = WeatherRequest;
