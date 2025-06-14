import 'package:bloc_weather/features/weather_detail/bloc/weather_detail_bloc.dart';
import 'package:bloc_weather/features/weather_detail/bloc/weather_detail_state.dart';
import 'package:bloc_weather/features/weather_detail/data/models/weather_detail_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class WeatherDetailPage extends StatefulWidget {
  const WeatherDetailPage({
    super.key,
    required this.name,
    required this.latitude,
    required this.longitude,
  });
  final String name;
  final double latitude;
  final double longitude;
  @override
  State<WeatherDetailPage> createState() => _WeatherDetailPageState();
}

class _WeatherDetailPageState extends State<WeatherDetailPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      getWeatherDetail();
    });
  }

  void getWeatherDetail() {
    BlocProvider.of<WeatherDetailBloc>(context).getWeatherDetail(
        latitude: widget.latitude, longitude: widget.longitude);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigoAccent,
        foregroundColor: Colors.white,
        title: Text("Weather Detail"),
        centerTitle: false,
        leading: SizedBox.shrink(),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xff5C6BC0), Color(0xff3949AB), Color(0xff283593)],
          ),
        ),
        child: BlocBuilder<WeatherDetailBloc, WeatherDetailState>(
          builder: (context, state) {
            return switch (state) {
              // TODO: Handle this case.
              WeatherDetailLoading() => Center(
                  child: CircularProgressIndicator.adaptive(),
                ),
              // TODO: Handle this case.
              WeatherDetailSuccess(detail: WeatherDetail weatherDetail) =>
                _currentWeather(weatherDetail),
              // TODO: Handle this case.
              WeatherDetailFailed() => Center(
                  child: Text("City Search Failed"),
                ),
            };
          },
        ),
      ),
    );
  }

  Widget _currentWeather(WeatherDetail detail) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(widget.name),
      ],
    );
  }
}
