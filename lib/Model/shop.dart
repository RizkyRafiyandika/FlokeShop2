import 'package:flutter/cupertino.dart';
import 'package:flokemon/Model/product.dart';

class Shop extends ChangeNotifier {
  final List<Product> _shop = [
    Product(
      id: '001',
      name: 'Raikiri',
      price: 129.99,
      description: 'assets/images/thunder.png',
      imagePath: 'assets/pikachu.png',
    ),
    Product(
      id: '002',
      name: 'Kuramon',
      price: 999.99,
      description: 'assets/images/darkness.png',
      imagePath: 'assets/kuramon.png',
    ),
    Product(
      id: '003',
      name: 'Gokakyu',
      price: 59.99,
      description: 'assets/fire.png',
      imagePath: 'assets/charozaHD.png',
    ),
    Product(
      id: '004',
      name: 'Blast',
      price: 99.99,
      description: 'assets/images/water.png',
      imagePath: 'assets/blastoise.png',
    ),
  ];

  final List<Product> _cart = [];

  final List<Product> _inventory = []; // Add this line for inventory

  List<Product> get shop => _shop;

  List<Product> get cart => _cart;

  List<Product> get inventory => _inventory;

  void addCart(Product item) {
    _cart.add(item);
    notifyListeners();
  }

  void removeCart(Product item) {
    _cart.remove(item);
    notifyListeners();
  }

  void buyItems(List<Product> cart) {
    for (var item in cart) {
      _cart.remove(item); // Remove item from cart
      addToInventory(item); // Add item to inventory
    }
    notifyListeners();
  }

  void addToInventory(Product item) {
    _inventory.add(item);
    notifyListeners();
  }

  void addToCart(Product product) {
    _cart.add(product);
    notifyListeners();
  }

  double calculateTotalPrice(List<Product> withList) {
    double totalPrice = 0;
    for (var product in withList) {
      totalPrice += product.price;
    }
    return totalPrice;
  }
}
