// ignore_for_file: curly_braces_in_flow_control_structures

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:online_grocery/models/samples.dart';
import 'package:online_grocery/providers/product_provider.dart';

class ProductsProvider with ChangeNotifier {
   List<Product> _items = Samples.setRandomProducts();
   List<Product> get items{
     return _items;
   }

   List<Product> vItems = [];
   List<Product> fItems = [];
   List<Product> fastItems = [];
   List<Product> randomItems = [];
   List<Product> favItems = [];
   List<Product> searchItems = [];
   bool isLoading = false;
   List<Product> getSpecificItemsList(String s){
     print('called');
     if(s == 'Vegetables'){
       return vItems;
     }
     else if(s == 'Fast food'){
       return fastItems;
     }
     else if(s == 'Fruits'){
       return fItems;
     }
     return fItems;
   }

  Future<void> setRandomProducts() async {
    print('called1');
    const url =
        'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/products.json';
    for (var product in _items) {
      try{
        final res = await http.post(Uri.parse(url),
            body: json.encode({
              'name': product.name,
              'imageUrl': product.imageUri,
              'price': product.price,
              'catId': product.catId,
              'isFav': product.isFav,
            }));
        final resBody = json.decode(res.body);
        print(resBody['error']['message']);
      } catch(e){
      print(e);
    }

  }
}

  Future<void> getProducts() async {
    print('called2');
    const url = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/products.json';
    try {
      final res = await http.get(Uri.parse(url));
      final List<Product> loadedProducts = [];
      final extractedData = json.decode(res.body) as Map<String, dynamic>;

      if (extractedData == null) return;
      try{
        extractedData.forEach((prodId, prod) {
          print('prodId $prod' );
          loadedProducts.add(
              Product(
                  name: prod['name'],
                  imageUri: prod['imageUrl'],
                  catId: prod['catId'],
                  isFav: prod['isFav'],
                  price: prod['price'],
              )
          );
        });
      }catch(e){
        print(e.toString());
      }

      _items = loadedProducts;
      notifyListeners();


    }catch(e){
      print(e);
    }
  }

  Future<void> getVegetables() async {
     print('called 3');
     if(vItems.isNotEmpty) {
      notifyListeners();
      return;
    }
    const url = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/vegetables.json';
    try {
      final res = await http.get(Uri.parse(url));
      final List<Product> loadedProducts = [];
      final extractedData = json.decode(res.body) as Map<String, dynamic>;

      if (extractedData == null) return;
      try{
        extractedData.forEach((prodId, prod) {
          //print('prodId $prod' );
          loadedProducts.add(
              Product(
                  name: prod['name'],
                  imageUri: prod['imageUrl'],
                  catId: prod['catId'],
                  isFav: prod['isFav'],
                  price: prod['price'],
                  id: prodId,
              )
          );

        });
      }catch(e){
        print(e.toString());
      }

      vItems = loadedProducts;
      getFavorites();
      setRandomItems();
      notifyListeners();


    }catch(e){
      print(e);
    }
  }

  Future<void> getFruits() async {
    print('called4');
     if(fItems.isNotEmpty) {
       notifyListeners();
      return;
    }
    const url = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/fruits.json';
     try {
       final res = await http.get(Uri.parse(url));
       final List<Product> loadedProducts = [];
       final extractedData = json.decode(res.body) as Map<String, dynamic>;
       if (extractedData == null) return;
       try{
         extractedData.forEach((prodId, prod) {
           //print('prodId $prod' );
           loadedProducts.add(
               Product(
                 name: prod['name'],
                 imageUri: prod['imageUrl'],
                 catId: prod['catId'],
                 isFav: prod['isFav'],
                 price: prod['price'],
                 id: prodId,
               )
           );

         });
       }catch(e){
         print(e.toString());
       }

       fItems = loadedProducts;
       getFavorites();
       setRandomItems();
       notifyListeners();


     }catch(e){
       print(e);
     }
   }

   Future<void> getFastFood() async {

     print('called5');
     print('1 items count = ${fastItems.length}');
     const url = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/fastfood.json';
     try {
       final res = await http.get(Uri.parse(url));
       final List<Product> loadedProducts = [];
       final extractedData = json.decode(res.body) as Map<String, dynamic>;

       if (extractedData == null) return;
       try{
         extractedData.forEach((prodId, prod) {
          // print('prodId $prod' );
           loadedProducts.add(
               Product(
                 name: prod['name'],
                 imageUri: prod['imageUrl'],
                 catId: prod['catId'],
                 isFav: prod['isFav'],
                 price: prod['price'],
                 id: prodId,
               )
           );

         });
       }catch(e){

       }
       fastItems = loadedProducts;
       notifyListeners();
       getFavorites();
       setRandomItems();

     }catch(e){
     }

     print('1 items count = ${fastItems.length}');
   }

   Future<void> setFavourite(Product product) async{
     print('called6');
     print('liked product id ${product.id}');
     final url = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/${product.catId}/${product.id}.json';
     if(product.catId == 'fruits'){
       fItems.firstWhere((element) => element.id == product.id).isFav = true;
       getFavorites();
     }
     else if(product.catId == 'vegetables'){
       vItems.firstWhere((element) => element.id == product.id).isFav = true;
       getFavorites();
     }
     else if(product.catId == 'fastFood'){
       fastItems.firstWhere((element) => element.id == product.id).isFav = true;
       getFavorites();
     }
     await http.patch(Uri.parse(url), body: json.encode({
       'isFav' : true,
     })).then((value) {

     }).catchError((error){
       if(product.catId == 'fruits'){
         fItems.firstWhere((element) => element.id == product.id).isFav = false;
         getFavorites();
       }
       else if(product.catId == 'vegetables'){
         vItems.firstWhere((element) => element.id == product.id).isFav = false;
         getFavorites();
       }
       else if(product.catId == 'fastFood'){
         fastItems.firstWhere((element) => element.id == product.id).isFav = false;
         getFavorites();
       }
     });
   }

   Future<void> setUnFavourite(Product product) async{
     print('called7');
     print('unliked product id ${product.id}');

     final url = 'https://grocery-app-8ba8e-default-rtdb.firebaseio.com/${product.catId}/${product.id}.json';

     if(product.catId == 'fruits'){
       fItems.firstWhere((element) => element.id == product.id).isFav = false;
       getFavorites();
       notifyListeners();
     }
     else if(product.catId == 'vegetables'){
       vItems.firstWhere((element) => element.id == product.id).isFav = false;
       getFavorites();
       notifyListeners();
     }
     else if(product.catId == 'fastFood'){
       fastItems.firstWhere((element) => element.id == product.id).isFav = false;
       getFavorites();
       notifyListeners();
     }

     await http.patch(Uri.parse(url), body: json.encode({
       'isFav' : false,
     })).then((value) {

     }).catchError((error){
       if(product.catId == 'fruits'){
         fItems.firstWhere((element) => element.id == product.id).isFav = true;
         getFavorites();
         notifyListeners();
       }
       else if(product.catId == 'vegetables'){
         vItems.firstWhere((element) => element.id == product.id).isFav = true;
         getFavorites();
         notifyListeners();
       }
       else if(product.catId == 'fastFood'){
         fastItems.firstWhere((element) => element.id == product.id).isFav = true;
         getFavorites();
         notifyListeners();
       }
     });
   }

  void getFavorites(){
    print('called8');
     favItems = [];
    if(vItems.isNotEmpty && fastItems.isNotEmpty && fItems.isNotEmpty){
      vItems.forEach((element) {
        if(element.isFav)
          favItems.add(element);
      });

      fItems.forEach((element) {
        if(element.isFav)
          favItems.add(element);
      });

      fastItems.forEach((element) {
        if(element.isFav)
          favItems.add(element);
      });
    }

    notifyListeners();

  }

  void setRandomItems(){
    print('called9');
   try {
      if (vItems.isNotEmpty && fItems.isNotEmpty && fastItems.isNotEmpty) {
        randomItems = vItems + fItems + fastItems;
        randomItems.shuffle();
        notifyListeners();
      }
    }
    catch(e){
     print(e);
    }
  }

  void reverseIsLoading(){
     isLoading = !isLoading;
     notifyListeners();
  }

  void searchWithSubString(String subString){
     searchItems = [];
     notifyListeners();
     Future.delayed(const Duration(seconds: 3));
     for (Product product in randomItems) {
       if(product.name.toLowerCase().contains(subString.toLowerCase()))
         searchItems.add(product);
     }
     reverseIsLoading();
     notifyListeners();
  }

  void resetSearchItems(){
     searchItems = [];
     notifyListeners();
  }




}
