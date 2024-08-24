import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_app/models/weather_model.dart';

class WeatherService {
  final Dio dio;
  final String baseURL = 'https://api.weatherapi.com/v1';
  final String apiKey = '6dd0118290ec4349b81203553232312';

  WeatherService(this.dio);

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    try {
      Response response =
          await dio.get('$baseURL/forecast.json?key=$apiKey&q=$cityName');
      return WeatherModel.fromJson(response.data);
    } on DioException catch (e) {
      final String errorMessage = e.response?.data['error']['message'] ??
          'Unexpected Error, please try again later';
      throw Exception(errorMessage);
    } catch (e) {
      log(e.toString());
      throw Exception('Oops, something went wrong!');
    }
  }
}
