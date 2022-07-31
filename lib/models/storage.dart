class Storage {
  late final num _id;
  String name;
  String? location;

  static const Map<String, String> storage = {
    'table' : 'storage',
    'key' : 'id',
    'field1' : 'name',
    'field2' : 'location',
  };

  Storage({required num id, required this.name, this.location}) {
    _id = id;
  }

  num get id => _id;
  
  Map<String, dynamic> toMap() {
    return {
      storage['key']! : _id,
      storage['field1']! : name,
      storage['field2']! : location,
    };
  }

}