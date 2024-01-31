class MyModel {
  final String name;
  final String icon;
  final String text;
  final num maxT;
  final num mainT;
  final num avgT;
  MyModel(
      {required this.name,
      required this.maxT,
      required this.mainT,
      required this.avgT,
      required this.icon,
      required this.text});

  factory MyModel.fromJson(json) {
    return MyModel(
        name: json["location"]["name"],
        maxT: json["forecast"]["forecastday"][0]["day"]["maxtemp_c"],
        mainT: json["forecast"]["forecastday"][0]["day"]["mintemp_c"],
        avgT: json["forecast"]["forecastday"][0]["day"]["avgtemp_c"],
        icon: json["forecast"]["forecastday"][0]["day"]["condition"]["icon"],
        text: json["forecast"]["forecastday"][0]["day"]["condition"]["text"]);
  }
}
