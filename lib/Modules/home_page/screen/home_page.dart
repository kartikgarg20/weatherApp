import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:open_weather_app/Modules/detail_page/screen/detail_page.dart';
import 'package:open_weather_app/Modules/home_page/cubit/home_page_cubit.dart';

import '../../../Data/city_weather_detail_model.dart';
import '../../../functions/celcius.dart';
import '../../../functions/icon_function.dart';
import '../widgets/app_bar_widget.dart';
import '../widgets/city_tile_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      // api call at the start of the page when the page builds
      create: (context) => HomePageCubit()..myFunc(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              const AppBarWidget(),
              Expanded(
                // bloc builder of the main page with the api
                child: BlocBuilder<HomePageCubit, HomePageState>(
                  builder: (context, state) {
                    if (state is HomePageLoading) {
                      return const Center(
                        // when the api is loading or processing the loading widget
                        child: CircularProgressIndicator(),
                      );
                    } else if (state is HomePageSuccess) {
                      return CityTile(
                        // function is completed is shows the data
                        myDetail: state.cityDetail,
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
