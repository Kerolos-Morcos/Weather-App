import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/helper/hand_shake_error.dart';
import 'package:weather_app/helper/theme_data.dart';
import 'package:weather_app/views/home_view.dart';
import 'package:weather_app/views/search_view.dart';

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
      child: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          return MaterialApp(
            routes: {
              SearchView.id: (context) => const SearchView(),
            },
            debugShowCheckedModeBanner: false,
            theme: themeData(context),
            home:  HomeView(),
          );
        },
      ),
    );
  }
}
