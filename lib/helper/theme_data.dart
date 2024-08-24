import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/helper/theme_color.dart';

ThemeData themeData(BuildContext context) {
  return ThemeData(
    appBarTheme: AppBarTheme(
      shadowColor: getThemeColor(
        BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus,
      )[200],
      color: getThemeColor(
        BlocProvider.of<GetWeatherCubit>(context).weatherModel?.weatherStatus,
      ),
    ),
  );
}
