import 'package:flutter/material.dart';
import 'package:online_grocery/providers/auth_provider.dart';
import 'package:online_grocery/providers/orders_provider.dart';
import 'package:online_grocery/providers/products_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../screens/home_screen.dart';
import 'providers/cart_provider.dart';

void main() {

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: AuthProvider()..tryAutoLogin()),
        ChangeNotifierProvider.value(value: ProductsProvider()..getVegetables()..getFastFood()..getFruits()),
        ChangeNotifierProvider.value(value: CartProvider()),
        ChangeNotifierProvider.value(value: OrdersProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Online grocery',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.green[500],
          accentColor: const Color.fromRGBO(255, 140, 0, 0.9),
        ),
        home: HomeScreen(showCart: false,),
        routes: {
          HomeScreen.routeName: (_) =>  HomeScreen(showCart: true,),
        },
      ),
    );
  }
}
