import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/cubit/weather_cubit.dart';
import 'package:weather/cubit/cubit/weather_state.dart';
import 'package:weather/screens/no_weather.dart';
import 'package:weather/screens/search_view.dart';
import 'package:weather/screens/weather_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  bool s = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        actions: [
          IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SearchView(),
                    ));
              },
              icon: const Icon(
                Icons.search,
                color: Colors.white,
                size: 35,
              ))
        ],
      ),
      body: BlocBuilder<WeatherCubit, WeatherState>(
        builder: (context, state) {
          if (state is NoWeatherState) {
            return NoWeather();
          } else if (state is WeatherLoaded) {
            return WeatherScreen();
          } else {
            return Center(
              child: Text(
                "Error",
                style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
              ),
            );
          }
        },
      ),
    );
  }
}
