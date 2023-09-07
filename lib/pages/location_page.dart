import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/services/repositories.dart';
import 'package:my_app/styles/app_colors.dart';
import 'package:my_app/styles/text_style.dart';
import 'package:my_app/widget/current_weather.dart';

import 'package:my_app/bloc/weather_bloc.dart';

String? city;

class LocationScreen extends StatelessWidget {
  const LocationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WeatherBloc(
        WeatherRepositories(),
      )..add(LoadWeatherEvent()),
      child: BlocBuilder<WeatherBloc, WeatherState>(
        builder: (context, state) {
          if (state is WeatherLoadingState) {
            return Container(
              color: AppColors.background,
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            );
          }

          if (state is WeatherErrorState) {
            return const Scaffold(
              backgroundColor: AppColors.background,
              body: Center(
                child: Text(
                  "Error",
                  style: AppStyle.errorStyle,
                ),
              ),
            );
          }

          if (state is WeatherLoadedState) {
            return Scaffold(
              backgroundColor: AppColors.background,
              body: SizedBox(
                width: double.infinity,
                child: currentWeather(
                    '${state.weather.icon}',
                    '${state.weather.temp?.round()}',
                    '${state.weather.cityName}',
                    '${state.weather.humidity}',
                    '${state.weather.wind}'),
              ),
            );
          }

          return Container();
        },
      ),
    );
  }
}
