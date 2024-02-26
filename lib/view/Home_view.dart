import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../view_model/bloc/weather_bloc.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    context.read<WeatherBloc>().add(WeatherFetchEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Weather App',
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              context.read<WeatherBloc>().add(WeatherFetchEvent());
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherFailedState) {
            return Center(
              child: Text(state.errorMessage),
            );
          }
          if (state is! WeatherSuccessState) {
            return const Center(
              child: CircularProgressIndicator.adaptive(),
            );
          }
          final value = state.weatherModel;
          String formattedDate =
              DateFormat.yMMMMd().format(value.list![0].dtTxt!);
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(value.city!.name!),
                  Text(value.city!.country!),
                  Text(formattedDate),
                  Text(value.list![0].weather![0].main!),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
