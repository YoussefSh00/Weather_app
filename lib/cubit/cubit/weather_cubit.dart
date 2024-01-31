import 'package:bloc/bloc.dart';
import 'package:weather/cubit/cubit/weather_state.dart';
import 'package:weather/dio/service.dart';
import 'package:weather/models/weathr_model.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit() : super(NoWeatherState());
  late MyModel model;
  setData(String value) async {
    try {
      model = await MyService().getData(cityName: value);
      emit(WeatherLoaded());
    } catch (e) {
      emit(WeatherFailed());
    }
  }
}