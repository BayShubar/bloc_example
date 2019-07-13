import 'dart:async';
import 'dart:math';
import 'package:bloc/bloc.dart';
import './bloc.dart';
import 'package:block_scratch/model/Weather.dart';

class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  @override
  WeatherState get initialState => InitialWeatherState();

  @override
  Stream<WeatherState> mapEventToState(
    WeatherEvent event,
  ) async* {
    // The event checker
    if (event is GetWeatherEvent) {
      // outputting a state from the asynchronous generator
      yield LoadingWeatherState();
      final Weather weather = await _fetchWeatherFromApi(event.cityName);
      yield LoadedWeatherState(weather);
    }
  }

  Future<Weather> _fetchWeatherFromApi(String cityName) {
    return Future.delayed(Duration(seconds: 1), () {
      return Weather(
        cityName: cityName,
        temperature: 20 + Random().nextInt(15) + Random().nextDouble(),
      );
    });
  }
}
