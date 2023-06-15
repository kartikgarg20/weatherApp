import 'package:flutter/material.dart';
import 'package:open_weather_app/Data/city_weather_detail_model.dart';
import 'package:open_weather_app/Modules/detail_page/widgets/app_bar_detail_widget.dart';
import 'package:open_weather_app/Modules/detail_page/widgets/detail_temp_widget.dart';
import 'package:open_weather_app/Modules/detail_page/widgets/hour_forcast_widget.dart';
import 'package:open_weather_app/Modules/detail_page/widgets/min_max_widget.dart';
import 'package:open_weather_app/functions/celcius.dart';
import 'package:open_weather_app/functions/icon_function.dart';

class CityDetail extends StatelessWidget {
  final String city;
  final CityWeatherDetail detail;
  CityDetail({Key? key, required this.city, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Container(
        // for the gradient of the background
        decoration: const BoxDecoration(
          gradient: RadialGradient(
            center: Alignment(0, -1),
            radius: 0.7,
            colors: [
              Color(0xFFD6672C),
              Colors.white,
            ],
          ),
        ),
        child: Column(
          children: [
            // app bar of the detail page
            const DetailAppBar(),
            // temp showing widgets
            DetailTempWidget(city: city, detail: detail),
            // detail of the city
            MinMaxWidget(city: city, detail: detail),
            // horizontal listveiw with the slide of the hourly time
            HourForcastwidget(city: city, detail: detail)
          ],
        ),
      )),
    );
  }
}
