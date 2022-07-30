class Usage {
  late num _id;
  num product;
  DateTime day;
  int quantity;

  Usage({required num id, required this.product, required this.day, required this.quantity}) {
    id = _id;
  }

  num get id => _id;
  
}