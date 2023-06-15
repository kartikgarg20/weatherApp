import 'package:flutter/material.dart';

import '../../../Data/city_weather_detail_model.dart';

class HourForcastwidget extends StatelessWidget {
  final String city;
  final CityWeatherDetail detail;
  HourForcastwidget({Key? key, required this.city, required this.detail})
      : super(key: key);

  List<String> dayForcast = ["10 AM", "11 AM", "12 PM", "1 PM", "2 PM", "3 PM"];

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Color.fromARGB(255, 225, 225, 225),
          thickness: 2,
        ),
        Container(
          height: 90,
          child: ListView.builder(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            itemCount: dayForcast.length,
            itemBuilder: (BuildContext context, int index) {
              return Container(
                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(
                    children: [
                      Text(dayForcast[index]),
                      Padding(
                        padding: const EdgeInsets.only(top: 5),
                        child: Align(
                          child: Image.asset(
                            "assets/sun.png",
                            scale: 5,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
