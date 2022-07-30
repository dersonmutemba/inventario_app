class Acquisition {
  late final num _id;
  num product;
  num? storage;
  DateTime day;
  DateTime? bestBefore;
  int quantity;
  double price;

  Acquisition({required num id, required this.product, this.storage, required this.day,
  this.bestBefore, required this.quantity, required this.price}) {
    _id = id;
  }

  num get id => _id;
  
}