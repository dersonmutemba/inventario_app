class Removal {
  late num _id;
  num product;
  DateTime day;
  int quantity;

  Removal({required num id, required this.product, required this.day, required this.quantity}) {
    _id = id;
  }

  num get id => _id;

}