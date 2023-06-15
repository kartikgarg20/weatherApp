import 'package:flutter/material.dart';
import 'package:open_weather_app/Data/city_weather_detail_model.dart';

import '../../../functions/celcius.dart';
import '../../../functions/icon_function.dart';

class DetailTempWidget extends StatelessWidget {
  final String city;
  final CityWeatherDetail detail;

  const DetailTempWidget({Key? key, required this.city, required this.detail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  city,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 14,
                      fontWeight: FontWeight.w500),
                ),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    // for the kelvin to celsius
                    ConvertC.letConvert(kelvin: detail.main.temp).toString(),
                    style:
                        TextStyle(fontSize: 180, fontWeight: FontWeight.w500),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Align(
                      child: Image.asset(
                        // for the icon of the type of weather
                        IconFuntion.getIcon(detail.weather[0].icon),
                        scale: 5,
                      ),
                    ),
                  ),
                  Spacer(),
                  Container(
                    height: 170,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 40),
                          child: Text(detail.weather[0].description),
                        ),
                        Text(
                            'Feels Like ${ConvertC.letConvert(kelvin: detail.main.feelsLike)}')
                      ],
                    ),
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}
