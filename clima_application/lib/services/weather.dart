import 'package:clima_application/services/location.dart';
import 'package:clima_application/services/networking.dart';

const apiKey = '65a482c8d13cf94e3733ed22e49e417d';
const openWeatherURL = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    Network network =
        Network('$openWeatherURL?q=$cityName&appid=$apiKey&units=metric');
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    Location location = Location();
    await location.getCurrentLocation();

    Network network = Network(
        '$openWeatherURL?lat=${location.Latitude}&lon=${location.Longitude}&appid=$apiKey&units=metric');

    var weatherData = await network.getData();
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 Time';
    } else if (temp > 20) {
      return 'Time for 🩳 and 👕';
    } else if (temp < 10) {
      return 'You\'ll Need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
