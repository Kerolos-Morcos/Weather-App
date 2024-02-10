import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/views/home_view.dart';

void main() {
  // Handling Handshake error in client
  HttpOverrides.global = MyHttpOverrides();
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(builder: (context) {
        return BlocBuilder<GetWeatherCubit, WeatherState>(
          builder: (context, state) {
            return MaterialApp(
              theme: ThemeData(
                appBarTheme: AppBarTheme(
                  elevation: 4,
                  scrolledUnderElevation: 0,
                  shadowColor: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherStatus,
                )[200],
                  color: getThemeColor(
                  BlocProvider.of<GetWeatherCubit>(context)
                      .weatherModel
                      ?.weatherStatus,
                ),
                ),
              ),
              home: const HomeView(),
              debugShowCheckedModeBanner: false,
            );
          },
        );
      }),
    );
  }
}

// // Handling Handshake error in client
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

MaterialColor getThemeColor(String? condition) {
  if (condition == null) {
    return Colors.blue;
  }
  switch (condition) {
    case 'Sunny':
    case 'Clear':
      return Colors.yellow;

    case 'Partly Cloudy ':
    case 'Patchy rain possible':
    case 'Patchy light rain':
    case 'Light rain':
    case 'Patchy snow possible':
    case 'Patchy light snow':
    case 'Light snow':
    case 'Patchy moderate snow':
    case 'Moderate snow':
    case 'Light snow showers':
      return Colors.lightBlue;

    case 'Cloudy ':
    case 'Overcast ':
    case 'Patchy freezing drizzle possible':
    case 'Light freezing rain':
    case 'Moderate or heavy freezing rain':
    case 'Light showers of ice pellets':
    case 'Moderate or heavy showers of ice pellets':
    case 'Ice pellets':
      return Colors.grey;

    case 'Mist':
    case 'Fog':
    case 'Freezing fog':
    case 'Blowing snow':
    case 'Blizzard':
      return Colors.orange;

    case 'Moderate rain at times':
    case 'Moderate rain':
      return Colors.blue;

    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.indigo;

    case 'Light rain shower':
      return Colors.teal;

    case 'Moderate or heavy rain shower':
    case 'Torrential rain shower':
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;

    case 'Patchy heavy snow':
    case 'Heavy snow':
    case 'Moderate or heavy snow showers':
      return Colors.blueGrey;


    default:
      return Colors.blue;
  }
}
