class Order {
  final String _size;
  final double _price;
  final String _flavor;

  Order(this._size, this._price, this._flavor);

  @override
  String toString() {
    return ')  Order: \n      Total: \$$_price\n      Flavor - ' + _flavor + "\n      Size - " + _size;
  }
}
