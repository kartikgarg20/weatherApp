import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:open_weather_app/Data/city_weather_detail_model.dart';

import '../../../functions/celcius.dart';
import '../../../functions/icon_function.dart';
import '../../detail_page/screen/detail_page.dart';

class CityTile extends StatelessWidget {
  final List<CityWeatherDetail> myDetail;
  CityTile({Key? key, required this.myDetail}) : super(key: key);

  // city details for the apis
  Map<String, String> locations = {
    "Delhi": "India",
    "Jaipur": "India",
    "Bharatpur": "India",
    "Bhopal": "India",
    "Manali": "India",
    "Noida": "India"
  };

  @override
  Widget build(BuildContext context) {
    // for the current time
    DateTime currentTime = DateTime.now();
    String formattedTime = DateFormat('h:mm a').format(currentTime);
    return ListView.separated(
      shrinkWrap: true,
      itemCount: myDetail.length,
      separatorBuilder: (BuildContext context, int index) {
        return const Divider(
          color: Color.fromARGB(255, 225, 225, 225),
          thickness: 2,
        );
      },
      itemBuilder: (BuildContext context, int index) {
        print(myDetail[index].weather[0].main);

        return InkWell(
          onTap: () {
            // pushimg to the another route on the click
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => CityDetail(
                  city: locations.keys.elementAt(index),
                  detail: myDetail[index],
                ),
              ),
            );
          },
          child: Container(
            height: 100,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        locations.values.elementAt(index),
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        locations.keys.elementAt(index),
                        style: const TextStyle(
                            fontSize: 24, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  Spacer(),
                  Column(
                    children: [
                      Text(
                        formattedTime,
                        style: TextStyle(color: Colors.grey),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Row(
                        children: [
                          Text(
                            // conversion of the kelvin to the celsius
                            "${ConvertC.letConvert(kelvin: myDetail[index].main.temp)} °",
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 24,
                                fontWeight: FontWeight.w500),
                          ),
                          Image.asset(
                            // getting the particular icon according to the weather
                            IconFuntion.getIcon(
                                myDetail[index].weather[0].main),
                            scale: 5,
                          )
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
