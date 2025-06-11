import 'package:bloc_weather/features/search/data/model/city_search_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../common/url_const.dart';

part 'search_api_services.g.dart';

@RestApi(baseUrl: UrlConst.baseUrl)
abstract class SearchApiServices {
  factory SearchApiServices(Dio dio) => _SearchApiServices(dio);
  @GET(UrlConst.search)
  Future<CityModel> searchCities({
    @Query("name") required String name,
    @Query("count") required int count,
  });
}
