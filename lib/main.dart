import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/pages/home_page.dart';

void main() {
  runApp(ChangeNotifierProvider(
      create: (context) {
        return weatherProvider();
      },
      child: WeatherApp()));
}

class WeatherApp extends StatelessWidget {
  WeatherModel? weather;
  @override
  Widget build(BuildContext context) {
    return (MaterialApp(
      theme: ThemeData(
        primarySwatch: Provider.of<weatherProvider>(context).weatherData == null
            ? Colors.blue
            : Provider.of<weatherProvider>(context).weatherData!.getThemColor(),
      ),
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));
  }
}
