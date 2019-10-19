class Item {
  String title;
  double temperature;
  double humidity;
  double weight;
  bool done;

  Item({this.title, this.temperature, this.humidity, this.weight, this.done});

  Item.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    temperature = json['temperature'];
    humidity = json['humidity'];
    weight = json['weight'];
    done = json['done'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['temperature'] = this.temperature;
    data['humidity'] = this.humidity;
    data['weight'] = this.weight;
    data['done'] = this.done;
    return data;
  }
}
