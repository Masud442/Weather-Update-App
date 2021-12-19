import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weather_app_pb_fl_01/constants.dart';
import 'package:weather_app_pb_fl_01/weather_provider.dart';

class ForecastPage extends StatelessWidget {
  const ForecastPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Consumer<WeatherProvider>(
          builder: (context, provider, _) => ListView.builder(
            itemCount: provider.forecastModel!.list!.length,
            itemBuilder: (context, i) {
              final model = provider.forecastModel!.list![i];
              return ListTile(
                leading: Image.network('$icon_prefix${model.weather![0].icon}$icon_suffix'),
                title: Text(model.dtTxt!),
                subtitle: Text('${model.main!.tempMax}/${model.main!.tempMin}\u00B0, ${model.weather![0].description}'),
              );
            },

          )
      ),
    );
  }
}
