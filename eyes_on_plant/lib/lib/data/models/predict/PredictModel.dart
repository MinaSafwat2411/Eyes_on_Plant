class PredictionModel {
  Prediction1? prediction1;
  Prediction1? prediction2;
  Prediction1? prediction3;

  PredictionModel({this.prediction1, this.prediction2, this.prediction3});

  PredictionModel.fromJson(Map<String, dynamic> json) {
    prediction1 = json['prediction_1'] != null
        ? new Prediction1.fromJson(json['prediction_1'])
        : null;
    prediction2 = json['prediction_2'] != null
        ? new Prediction1.fromJson(json['prediction_2'])
        : null;
    prediction3 = json['prediction_3'] != null
        ? new Prediction1.fromJson(json['prediction_3'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.prediction1 != null) {
      data['prediction_1'] = this.prediction1!.toJson();
    }
    if (this.prediction2 != null) {
      data['prediction_2'] = this.prediction2!.toJson();
    }
    if (this.prediction3 != null) {
      data['prediction_3'] = this.prediction3!.toJson();
    }
    return data;
  }
}

class Prediction1 {
  String? className;
  String? confidence;
  String? description;
  String? examplePicture;
  String? prevention;
  String? treatment;

  Prediction1(
      {this.className,
        this.confidence,
        this.description,
        this.examplePicture,
        this.prevention,
        this.treatment});

  Prediction1.fromJson(Map<String, dynamic> json) {
    className = json['class_name'];
    confidence = json['confidence'];
    description = json['description'];
    examplePicture = json['example_picture'];
    prevention = json['prevention'];
    treatment = json['treatment'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['class_name'] = this.className;
    data['confidence'] = this.confidence;
    data['description'] = this.description;
    data['example_picture'] = this.examplePicture;
    data['prevention'] = this.prevention;
    data['treatment'] = this.treatment;
    return data;
  }
}