class Product {
  final num _id;
  String _name;
  String? _category;
  double _price;
  Product({required this._id, required this._name, this._category, required this._price});
}