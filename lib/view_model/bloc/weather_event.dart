part of 'weather_bloc.dart';
@immutable
sealed class WeatherEvent {}

class WeatherFetchEvent extends WeatherEvent {}
