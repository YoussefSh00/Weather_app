import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/cubit/weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white, size: 30),
        backgroundColor: Colors.teal,
      ),
      body: Center(
        child: Container(
          margin: const EdgeInsets.all(20),
          child: TextField(
            onSubmitted: (value) {
              BlocProvider.of<WeatherCubit>(context).setData(value);
              Navigator.pop(context);
            },
            decoration: InputDecoration(
                suffixIcon: const Icon(Icons.search),
                hintText: "City Name",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15))),
          ),
        ),
      ),
    );
  }
}
