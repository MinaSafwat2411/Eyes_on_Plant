class CharacteristicsModel {
  final String? colorShape;
  final String? flavor;
  final String? foliage;
  final String? size;
  final String? varieties;
  final String? plant;
  final String? flowers;
  final String? fruit;

  CharacteristicsModel({
    this.colorShape,
    this.flavor,
    this.foliage,
    this.size,
    this.varieties,
    this.plant,
    this.flowers,
    this.fruit,
  });

  factory CharacteristicsModel.fromJson(Map<String, dynamic> data) {
    return CharacteristicsModel(
      colorShape: data['colorShape'],
      flavor: data['flavor'],
      foliage: data['foliage'],
      size: data['size'],
      varieties: data['varieties'],
      plant: data['plant'],
      flowers: data['flowers'],
      fruit: data['fruit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'colorShape': colorShape,
      'flavor': flavor,
      'foliage': foliage,
      'size': size,
      'varieties': varieties,
      'plant': plant,
      'flowers': flowers,
      'fruit': fruit,
    };
  }
}
