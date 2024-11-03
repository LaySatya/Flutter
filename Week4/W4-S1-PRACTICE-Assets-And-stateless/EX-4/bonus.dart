import 'package:flutter/material.dart';

enum Weather {
  Sunny,
  Rainy,
  Cloudy,
  Snowy,
}

enum WeekDay {
  Monday,
  Tuesday,
  Wednesday,
  Thursday,
  Friday,
  Saturday,
  Sunday,
}

// stateless widget
class WeatherForecast extends StatelessWidget {
  final Weather weather;
  final WeekDay weekDay;
  final int minTemperature;
  final int maxTemperature;

  const WeatherForecast({
    super.key,
    required this.weather,
    required this.weekDay,
    required this.minTemperature,
    required this.maxTemperature,
  });

  IconData getWeatherIcon(Weather weather) {
    switch (weather) {
      case Weather.Sunny:
        return Icons.wb_sunny; 
      case Weather.Rainy:
        return Icons.grain; 
      case Weather.Cloudy:
        return Icons.cloud;
      case Weather.Snowy:
        return Icons.ac_unit; 
    }
  }

  Color getWeaterIconColor(Weather weather){
    switch (weather) {
      case Weather.Sunny:
        return Colors.orange; 
      case Weather.Rainy:
        return Colors.blue; 
      case Weather.Cloudy:
        return Colors.grey;
      case Weather.Snowy:
        return const Color.fromARGB(255, 158, 220, 249); 
    }
  }
  String getWeekDay(WeekDay weekDay) {
    switch (weekDay) {
      case WeekDay.Monday:
        return 'Mon';
      case WeekDay.Tuesday:
        return 'Tue';
      case WeekDay.Wednesday:
        return 'Wed';
      case WeekDay.Thursday:
        return 'Thu';
      case WeekDay.Friday:
        return 'Fri';
      case WeekDay.Saturday:
        return 'Sat';
      case WeekDay.Sunday:
        return 'Sun';
    }
  }
  String getTheWeather(Weather weather) {
    switch (weather) {
      case Weather.Sunny:
        return 'Sunny☀️';
      case Weather.Rainy:
        return 'Rainy🌧️';
      case Weather.Cloudy:
        return 'Cloudy🌥️';
      case Weather.Snowy:
        return 'Snowy⛄';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 5,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            getWeekDay(weekDay),
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 17,
            ),
          ),
          const SizedBox(height: 10),
          Icon(
            getWeatherIcon(weather),
            size: 45,
            color: getWeaterIconColor(weather),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '$maxTemperature°',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                ),
              ),
              const SizedBox(width: 5),
              Text(
                '$minTemperature°',
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(height: 5),
          Text(
            getTheWeather(weather),
          )
        ],
      ),
    );
  }
}

// statefull widget
class ToggleScroll extends StatefulWidget {
  const ToggleScroll({super.key});

  @override
  State<ToggleScroll> createState() => _ToggleState();
}

class _ToggleState extends State<ToggleScroll> {
  bool isHorizontal = true;

  void toggleCardScroll(){
    setState(() {
      isHorizontal = !isHorizontal;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orangeAccent,
        focusColor: Colors.orangeAccent,
        onPressed: toggleCardScroll,
        child: Icon(
          color: Colors.white,
          isHorizontal ? Icons.view_column : Icons.view_list
        )
      ),
      backgroundColor: const Color.fromARGB(255, 241, 238, 238),
      appBar: AppBar(
        backgroundColor: Colors.orangeAccent,
        title: const Text(
          'Weather Forecast',
          style: TextStyle(color: Colors.white),
        ),
      ),
      
      body: SingleChildScrollView(
        scrollDirection: isHorizontal ? Axis.horizontal : Axis.vertical,
        child: isHorizontal
            ? Row(
                children: storeDataWeather(),
              )
            : Column(
                children: storeDataWeather(),
              ),
      ),
    );
  }
}
void main() {
  // var isHorizontal = true;
  runApp(const MaterialApp(
    home: ToggleScroll()
  ));
}


// list to store data of weather
List<Widget> storeDataWeather() {
  return [
    const WeatherForecast(
      weather: Weather.Rainy,
      weekDay: WeekDay.Monday,
      maxTemperature: 15,
      minTemperature: -3,
    ),
    const WeatherForecast(
      weather: Weather.Sunny,
      weekDay: WeekDay.Tuesday,
      maxTemperature: 20,
      minTemperature: 5,
    ),
    const WeatherForecast(
      weather: Weather.Cloudy,
      weekDay: WeekDay.Wednesday,
      maxTemperature: 18,
      minTemperature: 8,
    ),
    const WeatherForecast(
      weather: Weather.Snowy,
      weekDay: WeekDay.Thursday,
      maxTemperature: 12,
      minTemperature: -1,
    ),
    const WeatherForecast(
      weather: Weather.Rainy,
      weekDay: WeekDay.Friday,
      maxTemperature: 17,
      minTemperature: 0,
    ),
    const WeatherForecast(
      weather: Weather.Sunny,
      weekDay: WeekDay.Saturday,
      maxTemperature: 22,
      minTemperature: 8,
    ),
    const WeatherForecast(
      weather: Weather.Cloudy,
      weekDay: WeekDay.Sunday,
      maxTemperature: 20,
      minTemperature: 10,
    ),
    // Add more days as needed
  ];
}
