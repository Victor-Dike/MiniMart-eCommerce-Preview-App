import 'package:flutter/material.dart';

import 'package:minimart_ecommerce_preview_app/models/product.dart';

class Shop extends ChangeNotifier {

    Map<Product, int> cart = {};

  void addToCart(Product product, int quantity) {
    if (cart.containsKey(product)) {
      cart[product] = cart[product]! + quantity;
    } else {
      cart[product] = quantity;
    }
    notifyListeners();
  }
  

  void incrementQuantity(Product product) {
  if (cart.containsKey(product)) {
    cart[product] = cart[product]! + 1;
    notifyListeners();
  }
}

void decrementQuantity(Product product) {
  if (cart.containsKey(product) && cart[product]! > 1) {
    cart[product] = cart[product]! - 1;
    notifyListeners();
  }
}

void removeFromCart(Product product) {
  cart.remove(product);
  notifyListeners();
}
  
 final List<Product> _productMenu = [
    
    Product(
      imagePath: 'lib/images/iphone_16_finish_big.png',
      name: 'Apple iPhone 16', 
      description: '128GB|Teal', 
      price: '\$700.00',
    ),

    Product(
      imagePath: 'lib/images/macbooknew.png',
      name: 'M4 Macbook Air 13”',
      description: '256GB|Sky blue',
      price: '\$1000.00',
    ),

     Product(
      imagePath: 'lib/images/google_pixel.png',
      name: 'Google Pixel 9A',
      description: '128GB|Iris',
      price: '\$499.00',
    ),

    Product(
      imagePath: 'lib/images/airpodsnew.png',
      name: 'Apple Airpods 4',
      description: 'Active Noise Cancellation...',
      price: '\$129.00',
    ),
  ];
  // Customer Cart
  final List<Product> _cartList = [];

  // Getter Methods
  List<Product> get productMenu => _productMenu;
  List<Product> get cartList => _cartList;

  // Add to cart
  void addToCartToList(Product product, int quantity) {
    for (int i = 0; i < quantity; i++) {
      _cartList.add(product);
      notifyListeners();
    }
  }

  // Remove from cart
  void removeFromCartFromList(Product product) {
    _cartList.remove(product);
    notifyListeners();
  }
}
