import 'package:flutter/material.dart';
import 'package:online_grocery/providers/cart_provider.dart';
import 'package:online_grocery/screens/account_secreen.dart';
import 'package:online_grocery/screens/cart_screen.dart';
import 'package:online_grocery/screens/order_screen.dart';
import 'package:online_grocery/screens/shop_screen.dart';
import 'package:online_grocery/widgets/badge.dart';
import 'package:provider/provider.dart';


class HomeScreen extends StatefulWidget {
  bool showCart;
  HomeScreen({Key? key,  this.showCart = false}) : super(key: key);
   static const String routeName = '/cart';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   final List<Widget> _pages = [
    const ShopScreen(),
    const CartScreen(),
    const OrderScreen(),
    const AccountScreen(),
  ];
   int _currentIndex = 0;
  @override
  void initState() {
    super.initState();
    _currentIndex = widget.showCart==true? 1 : 0;
    widget.showCart = false;
    }



  @override
  Widget build(BuildContext context) {
    return Consumer<CartProvider>(
      builder: (context, value, child) => Scaffold(
        body: widget.showCart? _pages[1] : _pages[_currentIndex],
        bottomNavigationBar: buildBottomNavigationBar(context, value.items.length),
      ),
    );
  }


  BottomNavigationBar buildBottomNavigationBar(BuildContext context, int length) {
    return BottomNavigationBar(
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.grey[700],
        elevation: 2,
        showUnselectedLabels: true,
        currentIndex: _currentIndex,
        onTap: (value) => setState(() {
          _currentIndex = value;
        }),
        type: BottomNavigationBarType.fixed,
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.shop), label: 'Shop'),
          BottomNavigationBarItem(icon: Badge(
              value: '$length',
              child: const Icon(Icons.shopping_cart),
          isF: false),
              label: 'Cart'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag), label: 'My order'),
          const BottomNavigationBarItem(
              icon: Icon(Icons.favorite_outlined), label: 'Favourites'),
        ],
    );
  }
}
