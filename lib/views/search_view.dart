import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/helper/theme_color.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});
  static String id = 'SearchView';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(2),
          child: Container(
            color: Colors.black,
            height: 0.2,
          ),
        ),
        title: const Text(
          'Search city',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) {
              var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              getWeatherCubit.getWeather(cityName: value);
              if (context.mounted) Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              hintText: "Enter City Name",
              labelText: "Search",
              labelStyle: const TextStyle(
                color: Color.fromARGB(121, 0, 0, 0),
                fontWeight: FontWeight.bold,
              ),
              suffixIcon: const Icon(
                Icons.search,
              ),
              border: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherStatus,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: getThemeColor(
                    BlocProvider.of<GetWeatherCubit>(context)
                        .weatherModel
                        ?.weatherStatus,
                  ),
                ),
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
            ),
            cursorColor: getThemeColor(
              BlocProvider.of<GetWeatherCubit>(context)
                  .weatherModel
                  ?.weatherStatus,
            ),
            cursorWidth: 1,
          ),
        ),
      ),
    );
  }
}
