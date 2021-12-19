import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_pb_fl_01/weather_home.dart';
import 'package:weather_app_pb_fl_01/weather_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => WeatherProvider(),
    builder: (context, _) => MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        fontFamily: 'Rajdhani',
        primarySwatch: Colors.deepPurple,
        appBarTheme: AppBarTheme(
          elevation: 0
        ),
        textTheme: Theme.of(context).textTheme.apply(
          bodyColor: Colors.white,
          displayColor: Colors.white
        )
      ),
      home: WeatherHomePage(),
    );
  }
}


