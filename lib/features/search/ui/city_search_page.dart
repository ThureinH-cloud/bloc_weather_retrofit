import 'package:bloc_weather/features/search/bloc/city_search_cubit.dart';
import 'package:bloc_weather/features/search/bloc/city_search_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../data/model/city_search_model.dart';

class CitySearchPage extends StatefulWidget {
  const CitySearchPage({super.key});

  @override
  State<CitySearchPage> createState() => _CitySearchPageState();
}

class _CitySearchPageState extends State<CitySearchPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Weather Application"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _controller,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text("Search City"),
                suffixIcon: IconButton(
                  onPressed: () {
                    if (_controller.text.trim().isNotEmpty) {
                      BlocProvider.of<CitySearchCubit>(context)
                          .searchCity(city: _controller.text);
                    }
                  },
                  icon: Icon(Icons.search),
                ),
              ),
            ),
            Expanded(
              child: BlocBuilder<CitySearchCubit, CitySearchState>(
                builder: (context, state) {
                  return switch (state) {
                    // TODO: Handle this case.

                    // TODO: Handle this case.
                    CitySearchLoading() => Center(
                        child: CircularProgressIndicator.adaptive(),
                      ),
                    CitySearchInitial() => Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 80,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text("Search for a city")
                        ],
                      ),
                    // TODO: Handle this case.
                    CitySearchSuccess(cityModel: CityModel model) =>
                      _cityList(model),

                    // TODO: Handle this case.
                    CitySearchFailed() => Center(
                        child: Text("City Search Failed"),
                      ),
                  };
                },
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _cityList(CityModel model) {
    List<CitySearchModel> cities = model.results;
    return ListView.builder(
      itemCount: cities.length,
      itemBuilder: (context, index) {
        CitySearchModel city = cities[index];
        return ListTile(
          title: Text(city.name),
          subtitle: Text(city.country),
        );
      },
    );
  }
}
