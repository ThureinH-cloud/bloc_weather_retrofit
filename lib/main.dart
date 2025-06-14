import 'package:bloc_weather/features/search/bloc/city_search_cubit.dart';
import 'package:bloc_weather/features/search/ui/city_search_page.dart';
import 'package:bloc_weather/features/weather_detail/bloc/weather_detail_bloc.dart';
import 'package:bloc_weather/locator/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  await setUpLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => CitySearchCubit(),
            child: Container(),
          ),
          BlocProvider(
            create: (context) => WeatherDetailBloc(),
            child: Container(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CitySearchPage(),
        ));
  }
}
