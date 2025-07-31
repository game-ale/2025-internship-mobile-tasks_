class Product {
  String _name;
  String _description;
  double _price;

  Product(this._name, this._description, this._price);

  // Getters
  String get name => _name;
  String get description => _description;
  double get price => _price;

  // Setters
  set name(String name) => _name = name;
  set description(String description) => _description = description;
  set price(double price) => _price = price;

  @override
  String toString() {
    return 'Name: $_name\nDescription: $_description\nPrice: \$$_price';
  }
}
