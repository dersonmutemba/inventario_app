class Usage {
  late num _id;
  num product;
  DateTime day;
  int quantity;

  static const Map<String, String> usage = {
    'table' : 'usage',
    'key' : 'id',
    'field1' : 'product',
    'field2' : 'day',
    'field3' : 'quantity',
  };

  Usage({required num id, required this.product, required this.day, required this.quantity}) {
    id = _id;
  }

  num get id => _id;

  Map<String, dynamic> toMap() {
    return {
      usage['key']! : _id,
      usage['field1']! : product,
      usage['field2']! : day,
      usage['field3']! : quantity,
    };
  }
  
}