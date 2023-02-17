import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:weather_app/Models/weather_model.dart';

class WeatherService {
  String apiKey = '7ad4e35be14849019a0145549230802';
  String baseUrl = 'http://api.weatherapi.com/v1';

  Future<WeatherModel> getWeather({required String? cityName}) async {
    http.Response response = await http.get(
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=1'));

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);
    return weather;
  }
}
