import 'package:bloc_weather/features/search/bloc/city_search_state.dart';
import 'package:bloc_weather/features/search/data/model/city_search_model.dart';
import 'package:bloc_weather/features/search/data/services/search_api_services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get_it/get_it.dart';

class CitySearchCubit extends Cubit<CitySearchState> {
  CitySearchCubit() : super(CitySearchInitial());
  final SearchApiServices _searchApiServices = GetIt.I.get<SearchApiServices>();
  void searchCity({required String city}) async {
    try {
      emit(CitySearchLoading());
      CityModel cityModel =
          await _searchApiServices.searchCities(name: city, count: 12);
      emit(CitySearchSuccess(cityModel: cityModel));
    } catch (e) {
      emit(CitySearchFailed(errorMessage: "Failed To Load"));
    }
  }
}
