import 'package:flutter/material.dart';

const weather_api_key = '0ac8a6ac495d018dab257fd7be5456d3';
const cities = ['Athens','Berlin','Cairo','Dhaka','Delhi','Jakarta','Karachi','Los Angeles','London','Moscow','Milan','New York','Paris','Riyadh','Rome','Toronto','Tehran','Wuhan','Yangon'];
const icon_prefix = 'http://openweathermap.org/img/wn/';
const icon_suffix = '@2x.png';
const txt16 = TextStyle(fontSize: 16);
const txt16w54 = TextStyle(fontSize: 16, color: Colors.white54);
const txt18 = TextStyle(fontSize: 18);
const txt18w54 = TextStyle(fontSize: 18, color: Colors.white54);
const txt20 = TextStyle(fontSize: 20);
const txt22 = TextStyle(fontSize: 22);
const txt60 = TextStyle(fontSize: 60);

final verticalBar = Container(
  width: 2,
  height: 50,
  color: Colors.white54,
);
