import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_app/cubits/get_weather_cubit/get_weather_states.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class GetWeatherCubit extends Cubit<WeatherState> {
  GetWeatherCubit() : super(WeatherLoadingState());
  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoadingState());
    try {
      weatherModel =
          await WeatherService(Dio()).getCurrentWeather(cityName: cityName);
      emit(WeatherSuccessState());
    } catch (e) {
      emit(WeatherFailureState(e.toString()));
    }
  }
}
