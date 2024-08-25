import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_cubit.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/helper/theme_color.dart';
import 'package:weather_app/views/search_view.dart';
import 'package:weather_app/widgets/no_weather_body.dart';
import 'package:weather_app/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

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
          'Weather App',
        ),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, SearchView.id);
            },
            icon: const Icon(
              Icons.search,
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Center(
              child: CircularProgressIndicator(
                color: BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel != null ? getThemeColor(BlocProvider.of<GetWeatherCubit>(context)
                    .weatherModel?.weatherStatus)[700] : Colors.blue[800],
              ),
            );
          } else if (state is WeatherSuccessState) {
            return WeatherInfoBody(weatherModel: state.weatherModel);
          } else if (state is WeatherFailureState) {
            return const Center(
              child: Text(
                'Oops, Something Went Wrong',
                style: TextStyle(
                  fontSize: 26,
                ),
              ),
            );
          } else {
            return const NoWeatherBody();
          }
        },
      ),
    );
  }
}
