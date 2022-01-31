// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:online_grocery/providers/auth_provider.dart';
import 'package:online_grocery/providers/cart_provider.dart';
import 'package:online_grocery/providers/orders_provider.dart';
import 'package:online_grocery/widgets/product_cart_widget.dart';
import 'package:provider/provider.dart';

class SingleOrderScreen extends StatefulWidget {
  final Order order;
  const SingleOrderScreen({Key? key, required this.order, }) : super(key: key);

  @override
  State<SingleOrderScreen> createState() => _SingleOrderScreenState();
}

class _SingleOrderScreenState extends State<SingleOrderScreen> {
  bool popFromScreen = false;

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext globalContext) {
    return Scaffold(
      appBar: AppBar(elevation: 0, title: const Text('Order details'), backgroundColor: Colors.green,),
      body: SingleChildScrollView(scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsetsDirectional.only(start: 10),
                width: double.infinity,
                height: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Align(alignment: Alignment.centerLeft,child:
                    !widget.order.isDelivered?
                      Row(
                        children: [
                          Container(
                            height: 35,
                            width: 90,
                            decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Padding(
                              padding: EdgeInsetsDirectional.all(4),
                              child: Center(child: Text('Pending ⌛', style: TextStyle(color: Colors.white),)),
                            ),
                          ),
                          const SizedBox(width: 20,),
                          InkWell(
                            onTap: (){
                              showDialog(
                                  context: globalContext,
                                  builder: (context) => AlertDialog(
                                    title: const Text('Cancel order'),
                                    elevation: 10,
                                    content: const Text('Confirm cancelling this order?', style: TextStyle(color: Colors.red),),
                                    actions: [
                                      TextButton(
                                        onPressed: (){
                                          Provider.of<OrdersProvider>(context, listen: false)
                                              .cancelOrder(
                                            widget.order,
                                            Provider.of<AuthProvider>(context, listen: false)
                                                .userId!,
                                          );
                                          Navigator.of(globalContext).pop();
                                        },
                                        child: const Text('Confirm', style: TextStyle(color: Colors.green),),
                                      ),
                                      TextButton(
                                        onPressed: (){Navigator.pop(context);},
                                        child: const Text('Abort', style: TextStyle(color: Colors.red),),
                                      ),
                                    ],
                                  ),
                                  barrierDismissible: true
                              );
                            },
                            child: Container(
                              height: 35,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(10)
                              ),
                              child: const Padding(
                                padding: EdgeInsetsDirectional.all(4),
                                child: Center(child: Text('Cancel ❌',
                                  style: TextStyle(color: Colors.white),)),
                              ),
                            ),
                          ),
                        ],
                      ) : Row(
                        children: [
                          Container(
                            height: 35,
                            width: 100,
                            decoration: BoxDecoration(
                                color: Colors.green,
                                borderRadius: BorderRadius.circular(10)
                            ),
                            child: const Padding(
                              padding: EdgeInsetsDirectional.all(4),
                              child: Center(child: Text('Delivered 😋', style: TextStyle(color: Colors.white),)),
                            ),
                          ),

                        ],
                      )

                ),
              ),
            ),
            ListView.builder(
                //addAutomaticKeepAlives: true,
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemCount: widget.order.cartItems.length,
                  itemBuilder: (context, index) {
                    if (widget.order.cartItems.isNotEmpty) {

                      return AnimationConfiguration.staggeredList(
                        position: index,
                        duration: const Duration(milliseconds: 500),
                        child: SlideAnimation(
                          horizontalOffset: 300,
                          child: FadeInAnimation(
                            child: ProductCartWidget(
                              product: widget.order.cartItems[index].product,
                              quantity: widget.order.cartItems[index].quantity,
                              isOrderDetails: true,
                            ),
                          ),
                        ),
                      );
                    }
                    return Container();
                  }),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsetsDirectional.only(start: 4, end: 4),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.orangeAccent,
                  borderRadius: BorderRadius.circular(12)
                ),
                  width: double.infinity,
                  height: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Total',
                          style: TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                        Text(
                          '\$${getTotalPrice(widget.order.cartItems).toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 16, color: Colors.black),
                        ),
                      ],
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
  double getTotalPrice(List<CartItem> cartItems){
    double totalPrice = 0;
    cartItems.forEach((cartItem) {
      totalPrice += (cartItem.quantity * cartItem.product.price);
    });

    return totalPrice;
  }
}
