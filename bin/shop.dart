import 'dart:io';

class Product {
  const Product({required this.id, required this.name, required this.price});
  final int id;
  final String name;
  final double price;
  String get displayName => '($initial)${name.substring(1)},price:\$$price';
  String get initial => name.substring(0, 1);
}

class Item {
  const Item({required this.product, this.quantity = 1});

  final Product product;
  final double quantity;
  double get price => quantity * product.price;
  @override
  String toString() => '$quantity x ${product.name}: \$$price';
}

class Cart {
  final Map<int, Item> _item = {};
  void addProduct(Product product) {
    final item = _item[product.id];
    if (item == null) {
      _item[product.id] = Item(product: product, quantity: 1);
    } else {
      _item[product.id] = Item(product: product, quantity: item.quantity + 1);
    }
  }

  double total() => _item.values
      .map((item) => item.price)
      .reduce((value, element) => value + element);

  @override
  String toString() {
    if (_item.isEmpty) {
      return 'Cart is Empty';
    }
    final itemizedList = _item.values.map((item) => item.toString()).join('\n');
    return '-----\n$itemizedList\nTotal: \$${total()}\n-----';
  }
}

const allProduct = [
  Product(id: 1, name: 'apples', price: 1.6),
  Product(id: 2, name: 'bananas', price: 0.7),
  Product(id: 3, name: 'courgettes', price: 1.0),
  Product(id: 4, name: 'grapes', price: 2.0),
  Product(id: 5, name: 'mushrooms', price: 0.8),
  Product(id: 6, name: 'potatos', price: 1.5),
];

void main() {
  final cart = Cart();
  while (true) {
    stdout
        .write('What do u want to do? (v)iew items,(a)dd items or (c)heckout:');
    final userInput = stdin.readLineSync();
    if (userInput == 'a') {
      final product = chooseProduct();
      if (product != null) {
        cart.addProduct(product);
        print(cart);
      }
    } else if (userInput == 'v') {
      print(cart);
    } else {
      //TODO: checkout
    }
  }
}

Product? chooseProduct() {
  final productList = allProduct.map((e) => e.displayName).join('\n');
  stdout.write('Avaliable products:\n$productList\nYour choice: ');
  final input = stdin.readLineSync();
  for (var product in allProduct) {
    if (product.initial == input) {
      return product;
    }
  }
  print('Not found!');
  return null;
}
