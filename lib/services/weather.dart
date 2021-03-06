
import 'package:clima/services/networking.dart';
import 'package:clima/services/location.dart';
const apiKey = '26e1730ec6d79478f1ec39da4796ea0d';
class WeatherModel {
  late double lat;
  late double long;
  Future<dynamic> getWeatherData() async{
    Location location = Location();
    await location.getLocation();
    lat = location.latitude;
    long = location.longitude;
    Networking networking = Networking(
        'http://api.openweathermap.org/data/2.5/weather?lat=$lat&lon=$long&appid=$apiKey&units=metric');
    var data = await networking.getWeatherData();
    return data;
  }

   Future<dynamic> getCityData(String cityName) async{
    Networking networking = Networking(
        'http://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=$apiKey&units=metric');
    var data = await networking.getWeatherData();
    return data;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '๐ฉ';
    } else if (condition < 400) {
      return '๐ง';
    } else if (condition < 600) {
      return 'โ๏ธ';
    } else if (condition < 700) {
      return 'โ๏ธ';
    } else if (condition < 800) {
      return '๐ซ';
    } else if (condition == 800) {
      return 'โ๏ธ';
    } else if (condition <= 804) {
      return 'โ๏ธ';
    } else {
      return '๐คทโ';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s ๐ฆ time';
    } else if (temp > 20) {
      return 'Time for shorts and ๐';
    } else if (temp < 10) {
      return 'You\'ll need ๐งฃ and ๐งค';
    } else {
      return 'Bring a ๐งฅ just in case';
    }
  }
}
