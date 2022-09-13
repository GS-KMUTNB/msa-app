class Screening {
  String? date;
  String? weight;
  String? height;
  String? bmi;
  List<String>? formData;

  Screening({this.date, this.weight, this.height, this.bmi, this.formData});

  Screening.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    weight = json['weight'];
    height = json['height'];
    bmi = json['bmi'];
    formData = json['form_data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['date'] = date;
    data['weight'] = weight;
    data['height'] = height;
    data['bmi'] = bmi;
    data['form_data'] = formData;
    return data;
  }
}
