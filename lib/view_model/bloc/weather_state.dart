part of 'weather_bloc.dart';

@immutable
sealed class WeatherState {}

class WeatherInitialState extends WeatherState {}

class WeatherSuccessState extends WeatherState {
  final WeatherModel weatherModel;
  WeatherSuccessState(this.weatherModel);
}

class WeatherFailedState extends WeatherState {
  final String errorMessage;
  WeatherFailedState(this.errorMessage);
}

class WeatherLoadingState extends WeatherState {}
