import 'package:clima_application/screens/city_screen.dart';
import 'package:clima_application/utilities/constants.dart';
import 'package:flutter/material.dart';
import 'package:clima_application/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({required this.LocationWeather});
  final LocationWeather;
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  WeatherModel weather = WeatherModel();
  int temper = 0;
  String weatherIcon = '';
  String weatherMessage = '';
  String cityName = '';

  @override
  void initState() {
    super.initState();
    updates(widget.LocationWeather);
  }

  void updates(dynamic weatherData) {
    setState(() {
      if (weatherData == null) {
        temper = 0;
        weatherIcon = 'Not Found';
        weatherMessage = 'Unable to get weather update';
        cityName = 'your city';
        return;
      }
      double temp = weatherData['main']['temp'];
      temper = temp.toInt();
      var condition = weatherData['weather'][0]['id'];
      weatherIcon = weather.getWeatherIcon(condition);
      cityName = weatherData['name'];
      weatherMessage = weather.getMessage(temper);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/bbbbbb.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  TextButton(
                    onPressed: () async {
                      var weatherData = await weather.getLocationWeather();
                      updates(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                  TextButton(
                    onPressed: () async {
                      var typedname = await Navigator.push(context,
                          MaterialPageRoute(builder: (context) {
                        return CityScreen();
                      }));
                      if (typedname != null) {
                        var weatherData =
                            await weather.getCityWeather(typedname);
                        updates(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                      color: Colors.blueGrey,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      '$temper°',
                      style: kTempTextStyle,
                    ),
                    Text(
                      weatherIcon,
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80.0),
                  child: Text(
                    "$weatherMessage in $cityName!",
                    textAlign: TextAlign.center,
                    style: kMessageTextStyle,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
