import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF20214F),
        hintColor: Colors.white,
        scaffoldBackgroundColor: Colors.white,
        textTheme: TextTheme(
          bodyLarge: TextStyle(color: Color(0xFF20214F)),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF20214F),
          titleTextStyle: TextStyle(color: Colors.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFF20214F)),
          ),
          labelStyle: TextStyle(color: Color(0xFF20214F)),
        ),
      ),
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
              style: ButtonStyle(
                backgroundColor: WidgetStateProperty.all(Color(0xFF20214F)),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
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
