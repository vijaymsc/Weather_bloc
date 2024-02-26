import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weath_man/view/Home_view.dart';
import 'package:weath_man/view_model/bloc/weather_bloc.dart';
import 'package:weath_man/view_model/weather_data_provider.dart';

import 'core/services/service_provider.dart';

void main() => runApp(const Home());

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => WeatherDataProvider(ServiceProvider()),
      child: BlocProvider(
        create: (context) => WeatherBloc(
          context.read<WeatherDataProvider>(),
        ),
        child: const MaterialApp(
          home: WeatherScreen(),
        ),
      ),
    );
  }
}
