import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_pb_fl_01/weather_provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  late WeatherProvider _provider;
  bool isOn = false;

  @override
  void didChangeDependencies() {
    _provider = Provider.of<WeatherProvider>(context);
    setState(() {
      isOn = _provider.getTempUnitStatus();
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListView(
        children: [
          SwitchListTile(
            activeColor: Colors.amber,
            value: isOn,
            title: Text('Convert temperature to Fahrenheit'),
            subtitle: Text('Default is Celsius'),
            onChanged: (value) {
              setState(() {
                isOn = value;
              });
              _provider.setTempUnitStatus(value);
            },
          )
        ],
      ),
    );
  }
}
