import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../model/weather_dataModel.dart';
import '../weather_data_provider.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  WeatherDataProvider weatherDataProvider;
  WeatherBloc(this.weatherDataProvider) : super(WeatherInitialState()) {
    on<WeatherFetchEvent>(_getWeatherFetchEvent);
  }
  void _getWeatherFetchEvent(
      WeatherFetchEvent event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadingState());
    try {
      final weather = await weatherDataProvider.getCurrentWeather();
      emit(WeatherSuccessState(weather));
    } catch (e) {
      emit(WeatherFailedState(e.toString()));
    }
  }
}
