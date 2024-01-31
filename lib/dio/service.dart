import 'package:dio/dio.dart';
import 'package:weather/models/weathr_model.dart';

class MyService {
  Dio dio = Dio();

  Future<MyModel> getData({required String cityName}) async {
    Response respones = await dio.get(
        "https://api.weatherapi.com/v1/forecast.json?key=1b0ef9a6f66a42c5ac4233804242301&q=$cityName&days=1");

    Map responesBody = respones.data;
    MyModel data = MyModel.fromJson(responesBody);
    return data;
  }
}
