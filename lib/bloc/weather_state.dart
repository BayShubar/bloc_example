import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:block_scratch/model/Weather.dart';

@immutable
abstract class WeatherState extends Equatable {
  WeatherState([List props = const []]) : super(props);
}

class InitialWeatherState extends WeatherState {}

class LoadingWeatherState extends WeatherState {}

class LoadedWeatherState extends WeatherState {
  final Weather weather;
  LoadedWeatherState(this.weather) : super([weather]);
}
