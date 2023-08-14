import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_weather/model.dart';
part 'states.dart';



class WeatherCubit extends Cubit<WeatherState>{
  WeatherCubit() : super(GetWeatherLoadingState());

  final cityController = TextEditingController(text: "cairo");
  WeatherData? model;

  void getData({bool fromPagination = false}) async {
    if(fromPagination)
    {
      emit(GetWeatherFromPaginationLoadingState());
    } else {
      emit(GetWeatherLoadingState());
    }
    try {
      final response = await Dio().get("https://api.openweathermap.org/data/2.5/weather?q=${cityController.text}&appid=509dc5d730ff2dd6003b22f30ae93313");
      model = WeatherData.fromJson(response.data);
      emit(GetWeatherSuccessState());
    } on DioException catch(ex)
    {
      if(fromPagination)
      {
        emit(GetWeatherFromPaginationFailedState(msg: ex.response!.data));
      } else {
        emit(GetWeatherFailedState(msg: ex.toString()));
      }
    }
  }
}