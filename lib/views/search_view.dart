import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:weather_app/models/weather_model.dart';
import 'package:weather_app/services/weather_service.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search city',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        backgroundColor: Colors.blue,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: TextField(
            onSubmitted: (value) async{
              weatherModel = await WeatherService(Dio()).getCurrentWeather(cityName: value);
              log(weatherModel!.cityName);
              if(context.mounted) Navigator.pop(context);
            },
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              hintText: "Enter City Name",
              labelText: "Search",
              suffixIcon: const Icon(
                Icons.search,
              ),
              suffixIconColor: Colors.blue,
              border: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(
                  10,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(
                  color: Colors.blue,
                ),
                borderRadius: BorderRadius.circular(
                  16,
                ),
              ),
            ),
            cursorColor: Colors.grey,
            cursorWidth: 1,
          ),
        ),
      ),
    );
  }
}

WeatherModel? weatherModel;