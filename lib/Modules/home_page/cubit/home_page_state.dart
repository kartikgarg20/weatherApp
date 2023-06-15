part of 'home_page_cubit.dart';

@immutable
abstract class HomePageState {}

class HomePageInitial extends HomePageState {}

class HomePageLoading extends HomePageState {}

class HomePageSuccess extends HomePageState {
  final List<CityWeatherDetail> cityDetail;
  HomePageSuccess({required this.cityDetail});
}

// class HomePageInitial extends HomePageState {}

