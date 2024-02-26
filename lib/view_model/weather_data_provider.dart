import 'dart:convert';

import 'package:flutter/foundation.dart';

import '../core/services/service_provider.dart';
import '../model/weather_dataModel.dart';

class WeatherDataProvider {
  final ServiceProvider serviceProvider;
  WeatherDataProvider(this.serviceProvider);
  Future<WeatherModel> getCurrentWeather() async {
    try {
      final weatherData =
          await serviceProvider.getServiceProviderData("chennai");
      var data = json.decode(weatherData);
      if (data['cod'] != '200') {
        throw 'An Unexpected error occurred';
      }
      return WeatherModel.fromJson(data);
      //compute(weatherModelFromJson, weatherData);
    } catch (e) {
      throw e.toString();
    }
  }
}
