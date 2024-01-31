import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather/cubit/cubit/weather_cubit.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(BlocProvider.of<WeatherCubit>(context).model.name,
                  style: const TextStyle(
                      fontSize: 40, fontWeight: FontWeight.bold)),
              const SizedBox(
                height: 100,
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              SizedBox(
                width: 50,
                height: 50,
                child: Image.network(
                    "https:${BlocProvider.of<WeatherCubit>(context).model.icon}"),
              ),
              Text(BlocProvider.of<WeatherCubit>(context).model.avgT.toString(),
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold)),
              Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                      BlocProvider.of<WeatherCubit>(context)
                          .model
                          .maxT
                          .toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                      BlocProvider.of<WeatherCubit>(context)
                          .model
                          .mainT
                          .toString(),
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(BlocProvider.of<WeatherCubit>(context).model.text,
                  style: const TextStyle(
                      fontSize: 30, fontWeight: FontWeight.bold))
            ],
          )
        ],
      ),
    );
  }
}
