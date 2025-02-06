import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: WeatherScreen(),
    );
  }
}

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});
  @override
  WeatherScreenState createState() => WeatherScreenState();
}

class WeatherScreenState extends State<WeatherScreen> {
  final TextEditingController cityController = TextEditingController();
  String cityName = '';
  String temperature = '';
  String weather = '';

void fetchWeather() {
  setState(() {
    cityName = cityController.text;
    temperature = '${(15 + (30 - 15) * (DateTime.now().millisecondsSinceEpoch % 100) / 100).toStringAsFixed(1)}°C';
    weather = ['Sunny', 'Cloudy', 'Rainy'][(DateTime.now().millisecondsSinceEpoch % 3)];
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Weather Info')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: cityController,
              decoration: InputDecoration(labelText: 'Enter City Name'),
            ),
            SizedBox(height: 10),
            ElevatedButton(
              onPressed: fetchWeather,
              child: Text('Fetch Weather'),
            ),
            SizedBox(height: 20),
            Text('City: $cityName'),
            Text('Temperature: $temperature'),
            Text('Weather: $weather'),
          ],
        ),
      ),
    );
  }
}
