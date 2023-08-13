import 'package:bubble_tea/models/tea.dart';
import 'package:flutter/material.dart';

class Shop extends ChangeNotifier {
  final List<Tea> _drinkMenu = [
    // pastèque
    Tea(
        name: "Watermelon",
        price: "5,90",
        imgPath: "lib/images/bt_red.png",
        stars: "4.4"),
    // mojito
    Tea(
        name: "Mojito",
        price: "6,50",
        imgPath: "lib/images/bt_green.png",
        stars: "4.2"),
    // café
    Tea(
        name: "Coffee",
        price: "4,90",
        imgPath: "lib/images/bt_coffee.png",
        stars: "4.7"),
    // framboise
    Tea(
        name: "Raspberry",
        price: "6,90",
        imgPath: "lib/images/bt_pink.png",
        stars: "4.9"),
  ];

  // panier
  List<Tea> _cart = [];

  // méthode get
  List<Tea> get drinkMenu => _drinkMenu;
  List<Tea> get cart => _cart;

  // ajouter au panier
  void addToCart(Tea tea, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cart.add(tea);
    }
    notifyListeners();
  }

  // retirer du panier
  void removeFromCart(Tea tea) {
    _cart.remove(tea);
    notifyListeners();
  }
}
