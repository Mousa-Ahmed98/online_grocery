import 'package:flutter/material.dart';
import 'package:online_grocery/providers/auth_provider.dart';
import 'package:online_grocery/providers/product_provider.dart';
import 'package:online_grocery/providers/products_provider.dart';
import 'package:online_grocery/screens/auth_screen.dart';
import 'package:online_grocery/widgets/product_shop_widget.dart';
import 'package:provider/provider.dart';

import 'splash_screen.dart';

class AccountScreen extends StatefulWidget {
  const AccountScreen({Key? key}) : super(key: key);

  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    print('is auth? ${Provider.of<AuthProvider>(context, listen: true).isAuth}');

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Favorites', style: TextStyle(color: Colors.white),),
        elevation: 0,
        backgroundColor: Colors.green,
      ),
      body: Consumer<AuthProvider>(
        builder: (context, auth, _) =>  auth.isAuth? Consumer<ProductsProvider>(
          builder: (context, value, child) => buildProductsShopGridView(
              context,
            value.favItems,
          ),
        ) : FutureBuilder(
            future: auth.tryAutoLogin(),
            builder: (context, snapshot) => snapshot.connectionState == ConnectionState.waiting
                ? const SplashScreen() : const AuthScreen(),
          ),
      ),
    );
  }

  Widget buildAccountScreen(){
    return Container(
      color: Colors.green,
    );
  }

  Widget buildProductsShopGridView(BuildContext context, List<Product> items) {
    return GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const ScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 300,
                childAspectRatio: 2.1 / 3,
                crossAxisSpacing: 10,
                mainAxisExtent: 250,
                mainAxisSpacing: 1,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) => ProductShopWidget(product: items[index]),
      );
  }


}

String reverse(String init){
  return init.split('').reversed.join();
}
