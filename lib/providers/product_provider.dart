import 'package:flutter/material.dart';

class Product with ChangeNotifier {
  String name;
  String imageUri;
  double price;
  bool isFav = false;
  String catId;
  String? id;

  Product({
    required this.name,
    required this.imageUri,
    required this.price,
    required this.catId,
    this.isFav = false,
     this.id,
  });
}
