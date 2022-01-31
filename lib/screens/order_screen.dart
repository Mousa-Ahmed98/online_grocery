import 'package:flutter/material.dart';
import 'package:online_grocery/providers/auth_provider.dart';
import 'package:online_grocery/providers/orders_provider.dart';
import 'package:online_grocery/providers/products_provider.dart';
import 'package:online_grocery/screens/single_order_screen.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatefulWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  State<OrderScreen> createState() => _OrderScreenState();
}

class _OrderScreenState extends State<OrderScreen> {
  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<OrdersProvider>(context, listen: false);
   provider.orders.isEmpty? provider
        .getOrders(Provider.of<AuthProvider>(context, listen: false).userId?? '') : null;
    return Scaffold(
        appBar: AppBar(
          title: const Text('My Orders'),
          backgroundColor: Colors.green,
        ),
        body: Consumer<OrdersProvider>(
          builder: (context, value, child) {
            var pro = Provider.of<AuthProvider>(context, listen: false).userId;
            if(pro == null || pro.isEmpty) {
              return const Center(child: Text('You have to login'),);
            }
            return provider.orders.isEmpty
                ? const Center(child: CircularProgressIndicator())
                : ListView.separated(
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) => buildOrderItem(provider.orders[index]),
                    separatorBuilder: (context, index) => const SizedBox(height: 10,),
                    itemCount: provider.orders.length);
          },
        ));
  }

  Widget buildOrderItem(Order order) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 160,
        child: Card(
            child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        child: order.cartItems.isNotEmpty
                            ? Image(
                                image: NetworkImage(
                                    order.cartItems[0].product.imageUri),
                              )
                            : Container(),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        child: order.cartItems.length > 1
                            ? Image(
                                image: NetworkImage(
                                    order.cartItems[1].product.imageUri),
                              )
                            : Container(),
                      )
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        height: 30,
                        width: 30,
                        child: order.cartItems.length > 2
                            ? Image(
                                image: NetworkImage(
                                    order.cartItems[2].product.imageUri),
                              )
                            : Container(),
                      ),
                      Container(
                        height: 30,
                        width: 30,
                        child: order.cartItems.length > 3
                            ? Image(
                                image: NetworkImage(
                                    order.cartItems[3].product.imageUri),
                              )
                            : Container(),
                      )
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              width: 30,
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    getOrderLongName(order),
                    softWrap: true,
                    style: const TextStyle(),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  if (!order.isDelivered)
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 90,
                          decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsetsDirectional.all(4),
                            child: Center(
                                child: Text(
                              'Pending ⌛',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        InkWell(
                          onTap: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: const Text('Cancel order'),
                                  elevation: 10,
                                  content: const Text('Confirm cancelling this order?', style: TextStyle(color: Colors.red),),
                                  actions: [
                                    TextButton(
                                        onPressed: (){
                                          Provider.of<OrdersProvider>(context, listen: false)
                                              .cancelOrder(
                                            order,
                                            Provider.of<AuthProvider>(context, listen: false)
                                                .userId!,
                                          );
                                          Navigator.pop(context);
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
                                borderRadius: BorderRadius.circular(10)),
                            child: const Padding(
                              padding: EdgeInsetsDirectional.all(4),
                              child: Center(
                                  child: Text(
                                'Cancel ❌',
                                style: TextStyle(color: Colors.white),
                              )),
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (order.isDelivered)
                    Row(
                      children: [
                        Container(
                          height: 35,
                          width: 100,
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)),
                          child: const Padding(
                            padding: EdgeInsetsDirectional.all(4),
                            child: Center(
                                child: Text(
                              'Delivered 😋',
                              style: TextStyle(color: Colors.white),
                            )),
                          ),
                        ),
                      ],
                    )
                ],
              ),
            ),
            const SizedBox(
              width: 10,
            ),
            IconButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => SingleOrderScreen(
                        order: order,
                      ),
                    ),
                  );
                },
                icon: const Icon(
                  Icons.arrow_forward_ios,
                  size: 16,
                ))
          ],
        )),
      ),
    );
  }

  String getOrderLongName(Order order) {
    print(order.isDelivered);
    if (order.cartItems.length > 4) {
      return '${order.cartItems[0].product.name}, ${order.cartItems[1].product.name}, '
          '${order.cartItems[2].product.name}, ${order.cartItems[3].product.name},...';
    } else {
      String s = '';
      for (var element in order.cartItems) {
        s = s + element.product.name + ', ';
      }
      s = s + '...';
      return s;
    }
  }
}
