class Product {
  late final num _id;
  String name;
  String? category;
  double price;
  Map<double, String>? mass;
  Map<double, String>? volume;
  
  Product({required num id, required this.name,  this.category, required this.price, this.mass,
  this.volume}) {
    _id = id;
  }

  num get id => _id;

  void setMass({required String unity, required double ammount}) {
    mass = {ammount, unity} as Map<double, String>?;
  }

  void setVolume({required String unity, required double ammount}) {
    volume = {ammount, unity} as Map<double, String>?;
  }

  String? getMassUnity() {
    return mass?.values.first;
  }

  double? getMass() {
    return mass?.keys.first;
  }

  String? getVolumeUnity() {
    return volume?.values.first;
  }

  double? getVolume() {
    return volume?.keys.first;
  }

}