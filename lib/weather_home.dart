import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_pb_fl_01/current_page.dart';
import 'package:weather_app_pb_fl_01/forecast_page.dart';
import 'package:weather_app_pb_fl_01/settings_page.dart';
import 'package:weather_app_pb_fl_01/weather_provider.dart';

import 'constants.dart';

class WeatherHomePage extends StatefulWidget {

  @override
  _WeatherHomePageState createState() => _WeatherHomePageState();
}

class _WeatherHomePageState extends State<WeatherHomePage> {
  late WeatherProvider _provider;
  final List<Widget> _tabPages = [CurrentPage(), ForecastPage()];
  var _selectedIndex = 0;

  @override
  void didChangeDependencies() {
    _provider = Provider.of<WeatherProvider>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text('Weather App'),
        actions: [
          IconButton(
            icon: Icon(Icons.my_location),
            onPressed: () {
              _provider.setNewCity(null);
            },
          ),
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: _CitySearchDelegate()).then((city) {
                print(city);
                if(city != null && city.isNotEmpty) {
                  _provider.setNewCity(city);
                }
              });
            },
          ),
          IconButton(
            icon: Icon(Icons.settings),
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => SettingsPage())),
          ),
        ],
      ),
      body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          decoration: BoxDecoration(
            color: Theme.of(context).primaryColor
          ),
            child: Center(
              child: _provider.hasCurrentDataLoaded && _provider.hasForecastDataLoaded ?
              _tabPages[_selectedIndex] :
              CircularProgressIndicator(color: Colors.white),
            )
        ),
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white30,
        backgroundColor: Colors.transparent,
        elevation: 0,
        currentIndex: _selectedIndex,
        onTap: (value) {
          setState(() {
            _selectedIndex = value;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud),
            label: 'Today'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: '5 Days'
          ),
        ],
      ),
    );
  }
}

class _CitySearchDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.cancel),
        onPressed: () {
          query = '';
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back),
      onPressed: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return ListTile(
      leading: Icon(Icons.search),
      title: Text(query),
      onTap: () {
        close(context, query);
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    var filteredList = query == null ? cities :
        cities.where((element) => element.toLowerCase().startsWith(query.toLowerCase())).toList();
    return ListView.builder(
      itemCount: filteredList.length,
      itemBuilder: (context, i) => ListTile(
        title: Text(filteredList[i]),
        onTap: () {
          query = filteredList[i];
          close(context, query);
        },
      ),
    );
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final theme = Theme.of(context);
    return theme.copyWith(
      primaryColor: Colors.deepPurple,
      backgroundColor: theme.primaryColor,
      scaffoldBackgroundColor: theme.primaryColor
    );
  }

}
