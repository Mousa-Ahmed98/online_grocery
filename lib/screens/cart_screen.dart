import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:online_grocery/providers/auth_provider.dart';
import 'package:online_grocery/providers/cart_provider.dart';
import 'package:online_grocery/widgets/product_cart_widget.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  double subTotal = 0.0;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Cart'),
        backgroundColor: Colors.green,
      ),
      body: Provider.of<CartProvider>(context, listen: true).items.isNotEmpty
          ? Column(
              children: [
                Expanded(
                  child: Consumer<CartProvider>(
                    builder: (context, cart, _) => ListView.builder(
                        //addAutomaticKeepAlives: true,
                        itemCount: cart.items.length,
                        itemBuilder: (context, index) {
                          if (cart.items.isNotEmpty) {
                            final cartItems = cart.items.values.toList();

                            return AnimationConfiguration.staggeredList(
                              position: index,
                              duration: const Duration(milliseconds: 500),
                              child: SlideAnimation(
                                horizontalOffset: 300,
                                child: FadeInAnimation(
                                  child: ProductCartWidget(
                                    product: cartItems[index].product,
                                    quantity: cartItems[index].quantity,
                                  ),
                                ),
                              ),
                            );
                          }
                          return Container();
                        }),
                  ),
                ),
                Container(
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Sub total',
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[500]),
                          ),
                          Text(
                            Provider.of<CartProvider>(context, listen: true)
                                .subTotal
                                .toStringAsFixed(2),
                            style: TextStyle(
                                fontSize: 13, color: Colors.grey[500]),
                          ),
                        ],
                      ),
                    )),
                Padding(
                  padding: const EdgeInsets.all(8),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 70,
                          child: ElevatedButton(
                            onPressed: () {
                              Provider.of<CartProvider>(context, listen: false).cancelOrder();
                            },
                            child: const Text(
                              'Cancel',
                              style: TextStyle(color: Colors.black),
                            ),
                            style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.white),
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: SizedBox(
                          height: 70,
                          child: ElevatedButton(
                            onPressed: () {
                              if (Provider.of<AuthProvider>(context, listen: false)
                                  .isAuth) {
                                setState(() {
                                  _isLoading = true;
                                });
                                Provider.of<CartProvider>(context, listen: false)
                                    .uploadOrder(Provider.of<AuthProvider>(context,
                                            listen: false)
                                        .userId!).then((value) => setState(() {
                                  _isLoading = false;
                                }));
                              } else {
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(const SnackBar(
                                  content: Text('You lust login first'),
                                ));
                              }
                            },
                            child: _isLoading
                                ? const CircularProgressIndicator(
                                    color: Colors.orangeAccent,
                                  )
                                : const Text(
                                    'Order Now',
                                    style: TextStyle(color: Colors.white),
                                  ),
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                Theme.of(context).primaryColor,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          : SizedBox(
              height: double.infinity,
              child: Column(
                children: const [
                  Image(
                    image: AssetImage('assets/images/playstore.png'),
                  ),
                  Center(
                    child: (Text(
                      'Your cart is empty, add some!',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18,
                      ),
                    )),
                  )
                ],
              ),
            ),
    );
  }

  void getSubTotal() {}
}
