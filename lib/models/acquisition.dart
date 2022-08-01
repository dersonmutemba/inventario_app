class Acquisition {
  late final num _id;
  num product;
  num? storage;
  DateTime day;
  DateTime? bestBefore;
  int quantity;
  double price;

  static const Map<String, String> acquisition = {
    'table' : 'acquision',
    'key' : 'id',
    'field1' : 'product',
    'field2' : 'storage',
    'field3' : 'day',
    'field4' : 'bestbefore',
    'field5' : 'quantity',
    'field6' : 'price',
  };

  Acquisition({required num id, required this.product, this.storage, required this.day,
  this.bestBefore, required this.quantity, required this.price}) {
    _id = id;
  }

  num get id => _id;

  Map<String, dynamic> toMap() {
    return {
      acquisition['key']! :_id,
      acquisition['field1']! : product,
      acquisition['field2']! : storage,
      acquisition['field3']! : day,
      acquisition['field4']! : bestBefore,
      acquisition['field5']! : quantity,
      acquisition['field6']! : price,
    };
  }
  
}