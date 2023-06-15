import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:open_weather_app/Data/city_weather_detail_model.dart';
import 'package:open_weather_app/Services/api_services.dart';

import '../../detail_page/screen/detail_page.dart';

part 'home_page_state.dart';

class HomePageCubit extends Cubit<HomePageState> {
  HomePageCubit() : super(HomePageInitial());

  // data for the api call 6 cities of the india and the lat long original data
  List<Map<String, double>> myListMap = [
    {"lat": 28.7041, "long": 77.1025},
    {"lat": 26.9124, "long": 75.7873},
    {"lat": 27.2152, "long": 77.5030},
    {"lat": 23.2599, "long": 77.4126},
    {"lat": 32.2432, "long": 77.1892},
    {"lat": 28.5355, "long": 77.3910}
  ];

  // where we save the data from the api
  List<CityWeatherDetail> myList = [];

  myFunc() async {
    emit(HomePageLoading());
    for (var i = 0; i < myListMap.length; i++) {
      // callig the api in the loop as we hve the 6 city data
      var data = await RemoteService.get(
          lat: myListMap[i]["lat"].toString(),
          long: myListMap[i]["lat"].toString());
      var res = CityWeatherDetail.fromJson(json.decode(data));

      // adding the data from the api
      myList.add(res);
    }
    emit(HomePageSuccess(cityDetail: myList));
  }
}
