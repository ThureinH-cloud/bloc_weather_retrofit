import 'package:bloc_weather/features/weather_detail/bloc/weather_detail_state.dart';
import 'package:bloc_weather/features/weather_detail/data/models/weather_detail_model.dart';
import 'package:bloc_weather/features/weather_detail/data/services/weather_detail_service.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class WeatherDetailBloc extends Cubit<WeatherDetailState> {
  WeatherDetailBloc() : super(WeatherDetailLoading());
  final WeatherDetailService _weatherDetailService =
      GetIt.I.get<WeatherDetailService>();
  void getWeatherDetail({
    required double latitude,
    required double longitude,
  }) async {
    try {
      emit(WeatherDetailLoading());
      WeatherDetail weatherDetail =
          await _weatherDetailService.getWeatherDetail(
              latitude: latitude, longitude: longitude, currentWeather: true);
      print(weatherDetail);
      emit(WeatherDetailSuccess(detail: weatherDetail));
    } catch (e) {
      print("Error is $e");
      emit(WeatherDetailFailed(errorMessage: "Fail to Load"));
    }
  }
}
