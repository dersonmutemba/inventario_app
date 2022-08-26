class Product {
  late final num _id;
  String name;
  String? category, image;
  double price;
  Map<double, String>? mass;
  Map<double, String>? volume;

  static const Map<String, String> product = {
    'table' : 'product',
    'key' : 'id',
    'field1' : 'name',
    'field2' : 'category',
    'field3' : 'price',
    'field4' : 'massamount',
    'field5' : 'massunity',
    'field6' : 'volumeamount',
    'field7' : 'volumeunity',
    'field8' : 'image',
  };
  
  Product({required num id, required this.name,  this.category, required this.price,
  this.mass, this.volume, this.image}) {
    _id = id;
  }

  num get id => _id;

  void setMass({required String unity, required double ammount}) {
    mass = {ammount : unity};
  }

  void setVolume({required String unity, required double ammount}) {
    volume = {ammount : unity};
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

  Map<String, dynamic> toMap() {
    return {
      product['key']! : _id,
      product['field1']! : name,
      product['field2']! : category,
      product['field3']! : price,
      product['field4']! : getMass(),
      product['field5']! : getMassUnity(),
      product['field6']! : getVolume(),
      product['field7']! : getVolumeUnity(),
      product['field8']! : image,
    };
  }

}