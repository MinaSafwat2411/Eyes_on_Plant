
import '../characteristics/characteristics_model.dart';
import '../growingconditions/growing_conditions_model.dart';

class VegetablesModel {
  final String? name;
  final String? overview;
  final GrowingConditionsModel? growingConditions;
  final CharacteristicsModel? characteristics;
  final String? image;

  VegetablesModel({
    this.name,
    this.overview,
    this.growingConditions,
    this.characteristics,
    this.image,
  });

  factory VegetablesModel.fromJson(Map<String, dynamic> json) {
    return VegetablesModel(
      name: json['name'],
      overview: json['overview'],
      image: json['image'],
      growingConditions: json['growingConditions'] != null
          ? GrowingConditionsModel.fromJson(json['growingConditions'] as Map<String, dynamic>)
          : null,
      characteristics: json['characteristics'] != null
          ? CharacteristicsModel.fromJson(json['characteristics'] as Map<String, dynamic>)
          : null,
    );
  }
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'overview': overview,
      'growingConditions': growingConditions?.toJson(),
      'characteristics': characteristics?.toJson(),
    };
  }
}
