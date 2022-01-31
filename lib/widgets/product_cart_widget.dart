import 'package:flutter/material.dart';
import 'package:online_grocery/providers/cart_provider.dart';
import 'package:online_grocery/providers/orders_provider.dart';
import 'package:online_grocery/providers/product_provider.dart';
import 'package:provider/provider.dart';

class ProductCartWidget extends StatefulWidget {
  final Product product;
  final quantity;
  bool isOrderDetails;
  ProductCartWidget({Key? key, required this.product, required this.quantity, this.isOrderDetails = false}) : super(key: key);

  @override
  _ProductCartWidgetState createState() => _ProductCartWidgetState();
}

class _ProductCartWidgetState extends State<ProductCartWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        height: 180,
        child: Card(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  children: [
                    SizedBox(
                      width: 100,
                      height: 70,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(2),
                        child: FadeInImage(placeholder: const AssetImage('assets/images/playstore.png'),
                          image: NetworkImage(widget.product.imageUri),
                        ),
                      ),
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            widget.product.name,
                            style: const TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        const SizedBox(height: 1,),
                        if(!widget.isOrderDetails)
                          Padding(
                            padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                            child: Row(
                              children: [
                                const Icon(Icons.production_quantity_limits,size: 16, color: Colors.orange,),
                                const SizedBox(width: 10,),
                                Text('${widget.product.price}\$ / kg'),
                              ],
                            ),
                          ),
                        if(widget.isOrderDetails)
                          Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                          child: Row(
                            children: [
                              const Icon(Icons.production_quantity_limits,size: 16, color: Colors.orange),
                              const SizedBox(width: 10,),
                              Text('${widget.quantity} kg'),
                            ],
                          ),
                        ),
                        if(widget.isOrderDetails)
                          const SizedBox(height: 10,),
                        if(widget.isOrderDetails)
                          Padding(
                          padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                          child: Row(
                            children: [
                              const Icon(Icons.attach_money,size: 16, color: Colors.orange,),
                              const SizedBox(width: 10,),
                              Text((widget.product.price * widget.quantity).toStringAsFixed(2)),
                            ],
                          ),
                        ),



                      ],
                    ),
                  ],
                ),
                if(!widget.isOrderDetails)
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(onPressed: (){
                            Provider.of<CartProvider>(context, listen: false).remove(widget.product);
                          }, icon: const Icon(Icons.remove_circle_rounded)),
                          Text('${widget.quantity}'),
                          IconButton(onPressed: (){
                            Provider.of<CartProvider>(context, listen: false).add(widget.product);
                          }, icon: const Icon(Icons.add_circle_outlined)),
                        ],
                      ),
                    ElevatedButton(onPressed: (){
                      Provider.of<CartProvider>(context, listen: false).delete(widget.product);
                    }, child: const Text('Delete')),
                  ],
                ),
              ],
            )
        ),
      ),
    );
  }

}
