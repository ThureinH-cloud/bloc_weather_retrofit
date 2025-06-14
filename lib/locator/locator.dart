import 'package:bloc_weather/features/search/data/services/search_api_services.dart';
import 'package:bloc_weather/features/weather_detail/data/services/weather_detail_service.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

Future<void> setUpLocator() async {
  GetIt getIt = GetIt.I;
  Dio dio = Dio();
  getIt.registerSingleton(SearchApiServices(dio));
  dio.interceptors.add(PrettyDioLogger());

  getIt.registerSingleton(WeatherDetailService(dio));
  dio.interceptors.add(PrettyDioLogger());
}
