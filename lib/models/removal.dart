class Removal {
  late num _id;
  num product;
  DateTime day;
  int quantity;

  static const Map<String, String> removal = {
    'table' : 'removal',
    'key' : 'id',
    'field1' : 'product',
    'field2' : 'day',
    'field3' : 'quantity',
  };

  Removal({required num id, required this.product, required this.day, required this.quantity}) {
    _id = id;
  }

  num get id => _id;

  Map<String, dynamic> toMap() {
    return {
      removal['key']! : _id,
      removal['field1']! : product,
      removal['field2']! : day,
      removal['field3']! : quantity,
    };
  }

}