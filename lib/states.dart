part of 'cubit.dart';

class WeatherState{}

class GetWeatherLoadingState extends WeatherState{}

class GetWeatherSuccessState extends WeatherState{}

class GetWeatherFailedState extends WeatherState{
  final String msg;

  GetWeatherFailedState({required this.msg});
}

// class GetWeatherFromPaginationLoadingState extends WeatherState{}
//
// class GetWeatherFromPaginationFailedState extends WeatherState{
//   final String msg;
//
//   GetWeatherFromPaginationFailedState({required this.msg});
// }
