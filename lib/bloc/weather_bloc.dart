import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:my_app/model/weather_model.dart';

import 'package:my_app/services/repositories.dart';

import '../pages/location_page.dart';

part 'weather_event.dart';
part 'weather_state.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final WeatherRepositories weatherRepositories;
  WeatherBloc(this.weatherRepositories) : super(WeatherLoadingState()) {
    on<LoadWeatherEvent>((event, emit) async {
      emit(WeatherLoadingState());
      try {
        final Weather? weather =
            await weatherRepositories.getCurrentWeather(city!);
        emit(WeatherLoadedState(weather!));
      } catch (e) {
        emit(WeatherErrorState(e.toString()));
      }
    });
  }
}
