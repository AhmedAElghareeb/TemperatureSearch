part of 'cubit.dart';

class WeatherStates{}

class GetWeatherLoadingState extends WeatherStates{}

class GetWeatherSuccessState extends WeatherStates{}

class GetWeatherFailedState extends WeatherStates{
  final String msg;

  GetWeatherFailedState({required this.msg});
}
