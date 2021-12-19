import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_pb_fl_01/constants.dart';
import 'package:weather_app_pb_fl_01/helper.dart';
import 'package:weather_app_pb_fl_01/weather_provider.dart';

class CurrentPage extends StatefulWidget {
  const CurrentPage({Key? key}) : super(key: key);

  @override
  _CurrentPageState createState() => _CurrentPageState();
}

class _CurrentPageState extends State<CurrentPage> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<WeatherProvider>(
        builder: (context, provider, _) => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(getFormattedDate(provider.currentModel!.dt!, 'MMMM dd, yyyy'), style: txt18w54),
            Text('${provider.currentModel!.name}, ${provider.currentModel!.sys!.country}', style: txt22),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.network('$icon_prefix${provider.currentModel!.weather![0].icon}$icon_suffix'),
                Text('${provider.currentModel!.main!.temp!.round()}\u00B0', style: txt60,),
              ],
            ),
            Text('Feels like: ${provider.currentModel!.main!.feelsLike!.round()}\u00B0, ${provider.currentModel!.weather![0].description}', style: txt18,),
            SizedBox(height: 30,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${provider.currentModel!.main!.humidity}%', style: txt16,),
                    SizedBox(height: 4,),
                    Text('Humidity', style: txt16w54,),
                  ],
                ),
                verticalBar,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${provider.currentModel!.main!.pressure}hPa', style: txt16,),
                    SizedBox(height: 4,),
                    Text('Pressure', style: txt16w54,),
                  ],
                ),
                verticalBar,
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text('${provider.currentModel!.visibility}KM', style: txt16,),
                    SizedBox(height: 4,),
                    Text('Visibility', style: txt16w54,),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
