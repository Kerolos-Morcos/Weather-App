import 'dart:io';

import 'package:flutter/material.dart';
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
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeView(),
    );
  }
}

// Handling Handshake error in client
 class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}