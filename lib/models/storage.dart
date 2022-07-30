class Storage {
  late final num _id;
  String name;
  String? location;
  Storage({required num id, required this.name, this.location}) {
    _id = id;
  }

  num get id => _id;
  
}