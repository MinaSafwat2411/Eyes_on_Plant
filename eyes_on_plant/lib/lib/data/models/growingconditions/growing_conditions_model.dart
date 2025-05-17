class GrowingConditionsModel {
  final String? growingSeason;
  final String? plantingTips;
  final String? soil;
  final String? sunlight;
  final String? temperature;
  final String? watering;

  GrowingConditionsModel({
    this.growingSeason,
    this.plantingTips,
    this.soil,
    this.sunlight,
    this.temperature,
    this.watering,
  });

  factory GrowingConditionsModel.fromJson(Map<String, dynamic> data) {
    return GrowingConditionsModel(
      growingSeason: data['growingSeason'],
      plantingTips: data['plantingTips'],
      soil: data['soil'],
      sunlight: data['sunlight'],
      temperature: data['temperature'],
      watering: data['watering'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'growingSeason': growingSeason,
      'plantingTips': plantingTips,
      'soil': soil,
      'sunlight': sunlight,
      'temperature': temperature,
      'watering': watering,
    };
  }
}
