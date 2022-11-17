import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weather_forcast/services/location.dart';

import 'networking.dart';

const apiKey = "8f1543ccbb188407f2312c48f6f87e57";
const weatherLocation = "https://api.openweathermap.org/data/2.5/weather";

class WeatherModel {
  Future<dynamic> getCityLocation(String cityName) async {
    var url =
        Uri.parse('$weatherLocation?q=$cityName&appid=$apiKey&units=metric');
    NetworkingHelper networkingHelper = NetworkingHelper(url: url);
    var weatherData = networkingHelper.getData();
    return weatherData;
  }

  Future<dynamic> getLocationData() async {
    Location location = Location();
    String? toast = await location.getCurrentLocation();
    Fluttertoast.showToast(
      msg: toast!,
      backgroundColor: Colors.black12,
    );
    var url = Uri.parse(
        '$weatherLocation?lat=${location.latitude}&lon=${location.longitude}&appid=$apiKey&units=metric');
    NetworkingHelper networkingHelper = NetworkingHelper(url: url);
    var weatherData = await networkingHelper.getData();
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
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
