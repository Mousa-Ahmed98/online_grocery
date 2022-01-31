import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'product_provider.dart';

class CartItem {
  final Product product;
  final int quantity;

  CartItem(this.product, this.quantity);
}

class CartProvider with ChangeNotifier {
  Map<String, CartItem> items = {};
  double subTotal = 0.0;

  void add(Product product) {
    if (items.containsKey(product.name)) {
      items.update(
        product.name,
        (existingProductItem) =>
            CartItem(product, existingProductItem.quantity + 1),
      );
    } else {
      items.putIfAbsent(product.name, () => CartItem(product, 1));
    }
    calcTotal();
    notifyListeners();
  }

  void remove(Product product) {
    if (items.containsKey(product.name)) {
      items.update(product.name, (existingProductItem) {
        return CartItem(product, existingProductItem.quantity - 1);
      });
      if (items[product.name]!.quantity == 0) {
        items.remove(product.name);
      }
    }
    calcTotal();
    notifyListeners();
  }

  void delete(Product product) {
      items.remove(product.name);
    calcTotal();
    notifyListeners();
  }

  void cancelOrder(){
    items.clear();
    notifyListeners();
  }
  void calcTotal() {
    subTotal = 0.0;
    for (int i = 0; i < items.length; i++) {
      subTotal += items.values.toList()[i].quantity *
          items.values.toList()[i].product.price;
    }
    notifyListeners();
  }

  Future<void> uploadOrder(String userId) async{
    final t = DateTime.now().millisecondsSinceEpoch;
    final url = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/orders/$userId/$t.json';
    Product tempProduct;
    http.Response res;
    int i = 0;
    items.values.toList().forEach((cartItem)
    async{
      tempProduct = cartItem.product;
      try{
        res = await http.post(Uri.parse(url), body: json.encode({
          'name' : tempProduct.name,
          'price' : tempProduct.price,
          'imageUri' : tempProduct.imageUri,
          'catId' : tempProduct.catId,
          'isFav' : tempProduct.isFav,
          'quantity' : cartItem.quantity,
        }));
        final resRes = json.decode(res.body);
        if(res.statusCode >= 400) {
          // ignore: avoid_print
          print('some error happened');
        }
        else{
          items.clear();
          notifyListeners();
        }

      // ignore: empty_catches
      }catch(e){

      }

    });

    await http.post(Uri.parse('https://grocery-app-8ba8e-default-rtdb.firebaseio.com/ordersDelivered/$userId/$t.json'), body:  json.encode({
      'isDelivered' : false
    }));

  }


}
