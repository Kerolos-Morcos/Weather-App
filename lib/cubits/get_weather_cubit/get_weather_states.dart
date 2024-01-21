class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherLoadedState extends WeatherState {}

class WeatherFailureState extends WeatherState {
  final String errorMessage;
  WeatherFailureState(this.errorMessage);
}
