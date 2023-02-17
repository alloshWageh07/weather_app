import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchPage extends StatelessWidget {
  String? cityName;
  SearchPage({required this.updateUi});
  VoidCallback? updateUi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search a City'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 25, horizontal: 16),
          child: TextField(
            onChanged: (data) {
              cityName = data;
            },
            onSubmitted: (data) async {
              cityName = data;
              WeatherService service = WeatherService();

              WeatherModel weather =
                  await service.getWeather(cityName: cityName!);
              Provider.of<weatherProvider>(context, listen: false).weatherData =
                  weather;
              Provider.of<weatherProvider>(context, listen: false).cityName =
                  cityName;
              Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 30, horizontal: 24),
              border: OutlineInputBorder(),
              hintText: 'Seach A City',
              suffix: GestureDetector(
                onTap: () async {
                  WeatherService service = WeatherService();

                  WeatherModel weather =
                      await service.getWeather(cityName: cityName!);
                  Provider.of<weatherProvider>(context, listen: false)
                      .weatherData = weather;
                  Provider.of<weatherProvider>(context, listen: false)
                      .cityName = cityName;
                  Navigator.pop(context);
                },
                child: Icon(
                  Icons.search,
                ),
              ),
              label: Text('Search In Wageh App'),
            ),
          ),
        ),
      ),
    );
  }
}
