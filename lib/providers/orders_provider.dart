// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_grocery/providers/cart_provider.dart';
import 'package:online_grocery/providers/product_provider.dart';

class Order {
  List<CartItem> cartItems;
  bool isDelivered;
  String? id;
  Order({required this.cartItems, this.isDelivered = false, required this.id});
}

class OrdersProvider with ChangeNotifier {
  List<Order> orders = [];

  void getOrders(String userId) async {
    if(userId.isEmpty)
      return;
    orders = [];
    final url =
        'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/orders/$userId.json';
    final res = await http.get(Uri.parse(url));

    final extractedData = json.decode(res.body) as Map<String, dynamic>;
    extractedData.forEach((key, value1) async {
      List<CartItem> items = [];
      (value1 as Map<String, dynamic>).forEach((key, value) {
        items.add(CartItem(
            Product(
              name: value['name'],
              imageUri: value['imageUri'],
              price: value['price'],
              catId: value['catId'],
              isFav: value['isFav'],
            ),
            value['quantity']));
      });

      print('key $key');
      final uri = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/ordersDelivered/$userId/$key.json';
      final res = await http.get(Uri.parse(uri));
      print('-----------------');
      var keyAndValue = json.decode(res.body) as Map<String, dynamic>;
      keyAndValue.forEach((key2, value) {
        if(value != null) {
          orders.add(Order(cartItems: items, id: key));
          orders[orders.length-1].isDelivered = (value as Map<String, dynamic>)['isDelivered'];
          notifyListeners();
          print('order is delivered? ${ orders[orders.length-1].isDelivered}');
        }
        print('-----------------');
      });

    });

    notifyListeners();
  }

  void cancelOrder(Order order, String userId) async{
    final uri = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/orders/$userId/${order.id}.json';
    orders.removeWhere((element) => element.id == order.id);
    notifyListeners();
    await http.delete(Uri.parse(uri)).then((value) async{
      final favouritesUri = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/ordersDelivered/$userId/${order.id}.json';
      await http.delete(Uri.parse(favouritesUri)).then((value) => null);
    }).catchError((error){
      orders.add(order);
      notifyListeners();
    });
  }
}
