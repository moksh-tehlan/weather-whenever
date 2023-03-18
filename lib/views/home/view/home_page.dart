import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:weather_whenever/data/models/current_location/current_location_model.dart';
import 'package:weather_whenever/data/repository/current_location/current_location_repository.dart';
import 'package:weather_whenever/data/repository/current_weather/current_weather_repository.dart';
import 'package:weather_whenever/navigation/routes.gr.dart';
import 'package:weather_whenever/typography/text_styles.dart';
import 'package:weather_whenever/utils/app_colors.dart';
import 'package:weather_whenever/utils/search_icon.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../di/service_locator.dart';
import '../../../utils/location_icon.dart';
import '../bloc/home_bloc.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    CurrentLocationModel currentLocationModel =
        CurrentLocationModel(latitude: 28.6, longitude: 76.9);
    return BlocProvider(
      create: (context) => HomeBloc(
          currentWeatherRepository: getIt<CurrentWeatherRepository>(),
          currentLocationRepository: getIt<CurrentLocationRepository>())
        ..add(HomeEvent.getCurrentWeather(
            currentLocationModel: currentLocationModel)),
      child: const _HomePageView(),
    );
  }
}

class _HomePageView extends StatelessWidget {
  const _HomePageView();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: FractionalOffset.topCenter,
                end: FractionalOffset.bottomCenter,
                colors: [
                  Color(0xffAEE2FF),
                  Color(0xFFE3F6FF),
                  Color(0xffFFF2F2)
                ]),
          ),
          child: Column(
            children: [
              Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    height: 250,
                    width: double.infinity,
                    margin: const EdgeInsets.only(bottom: 55),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.elliptical(300, 150),
                        bottomRight: Radius.elliptical(300, 150),
                      ),
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              LocationIcon(
                                  onTap: () => context.read<HomeBloc>().add(
                                      const HomeEvent.getCurrentWeather())),
                              SearchIcon(
                                  onTap: () => context.pushRoute(SearchRoute())),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<HomeBloc, HomeState>(
                          buildWhen: (previous, current) =>
                              previous.runtimeType != current.runtimeType,
                          builder: (context, state) {
                            return state.maybeWhen(
                              orElse: () => const SizedBox(),
                              loading: () => Column(
                                children: [
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Shimmer.fromColors(
                                    period: const Duration(milliseconds: 1000),
                                    baseColor: Colors.white,
                                    highlightColor: const Color.fromARGB(174, 240, 240, 240),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.red,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      height: 35,
                                      width: 250,
                                      child: const Text('lelo'),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Shimmer.fromColors(
                                    period: const Duration(milliseconds: 1000),
                                    baseColor: Colors.white,
                                    highlightColor: const Color.fromARGB(174, 240, 240, 240),
                                    child: Container(
                                      decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(6)),
                                      height: 25,
                                      width: 100,
                                    ),
                                  ),
                                ],
                              ),
                              loaded: (model) => Column(
                                children: [
                                  Text(model.name?.toString() ?? '',
                                      style: CustomTextStyles
                                          .headline1.size42.bold
                                          .withColor(AppColors.black)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(model.weather?[0].main ?? '',
                                      style: CustomTextStyles
                                          .bodyText1.size22.bold
                                          .withColor(AppColors.black)),
                                ],
                              ),
                            );
                          },
                        )
                      ],
                    ),
                  ),
                  const Image(
                    height: 120,
                    width: 120,
                    image: AssetImage('assets/images/sun.png'),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
