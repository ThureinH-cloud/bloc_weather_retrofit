import 'package:bloc_weather/features/search/bloc/city_search_cubit.dart';
import 'package:bloc_weather/features/search/ui/city_search_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) => CitySearchCubit(),
        child: const CitySearchPage(),
      ),
    );
  }
}
