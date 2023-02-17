import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app/Models/weather_model.dart';
import 'package:weather_app/Providers/weather_provider.dart';
import 'package:weather_app/pages/search_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  void updateUi() {
    setState(() {});
  }

  WeatherModel? weatherData;

  @override
  Widget build(BuildContext context) {
    weatherData = Provider.of<weatherProvider>(context).weatherData;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  return SearchPage(
                    updateUi: updateUi,
                  );
                }));
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Weather App'),
      ),
      body: weatherData == null
          ? Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'there is no weather 😔 start',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  ),
                  Text(
                    'searching now 🔍',
                    style: TextStyle(
                      fontSize: 30,
                    ),
                  )
                ],
              ),
            )
          : Container(
              decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                weatherData!.getThemColor(),
                weatherData!.getThemColor()[300]!,
                weatherData!.getThemColor()[100]!
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Spacer(
                    flex: 3,
                  ),
                  Text(
                    Provider.of<weatherProvider>(context).cityName!,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    'Updated at : ${weatherData!.date.hour.toString()}:${weatherData!.date.minute.toString()}',
                    style: TextStyle(fontSize: 22),
                  ),
                  Spacer(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(weatherData!.getImage()),
                      Text(
                        weatherData!.temp.toInt().toString(),
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.bold),
                      ),
                      Column(
                        children: [
                          Text('maxTemp : ${weatherData!.maxTemp.toInt()}'),
                          Text('minTemp : ${weatherData!.minTemp.toInt()}'),
                        ],
                      ),
                    ],
                  ),
                  Spacer(
                    flex: 2,
                  ),
                  Text(
                    weatherData!.weatherStateName,
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  Spacer(
                    flex: 5,
                  ),
                ],
              ),
            ),
    );
  }
}
