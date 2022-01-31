// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:online_grocery/providers/auth_provider.dart';
import 'package:online_grocery/providers/cart_provider.dart';
import 'package:online_grocery/providers/product_provider.dart';
import 'package:online_grocery/providers/products_provider.dart';
import 'package:provider/provider.dart';

class ProductShopWidget extends StatefulWidget {
  final Product product;

  const ProductShopWidget({Key? key, required this.product}) : super(key: key);

  @override
  _ProductShopWidgetState createState() => _ProductShopWidgetState();
}

class _ProductShopWidgetState extends State<ProductShopWidget> {
  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context, listen: false);
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Card(
        elevation: 5,
        child: Stack(
          children: [
            Center(
              child: FadeInImage(
                placeholder: const AssetImage('assets/images/playstore.png'),
                image: NetworkImage(widget.product.imageUri),
              ),
            ),
            Positioned(
              top: 2,
              right: 2,
              child: IconButton(
                icon: widget.product.isFav
                    ? const Icon(
                  Icons.favorite,
                  color: Colors.red,
                )
                    : const Icon(Icons.favorite_outline),
                onPressed: () async {
                  {
                    if (!widget.product.isFav)
                      Provider.of<ProductsProvider>(context, listen: false)
                          .setFavourite(widget.product);
                    else
                      Provider.of<ProductsProvider>(context, listen: false)
                          .setUnFavourite(widget.product);
                  }

                  {
                    if (!widget.product.isFav)
                      Provider.of<ProductsProvider>(context, listen: false)
                          .setFavourite(widget.product);
                    else
                      Provider.of<ProductsProvider>(context, listen: false)
                          .setUnFavourite(widget.product);
                  }

                  {
                    if (!widget.product.isFav)
                      Provider.of<ProductsProvider>(context, listen: false)
                          .setFavourite(widget.product);
                    else
                      Provider.of<ProductsProvider>(context, listen: false)
                          .setUnFavourite(widget.product);
                  }
                },
              ),
            ),
            Positioned(
              bottom: 5,
              left: 5,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      widget.product.name,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 1,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Text(
                      '\$${widget.product.price}/kg',
                      style: const TextStyle(
                        color: Colors.black87,
                        fontSize: 13,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          width: 40,
                          height: 20,
                          decoration: BoxDecoration(
                            color: Theme.of(context).colorScheme.secondary,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                              '\$0',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              bottom: -2,
              right: -2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: 30,
                  height: 30,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(4)),
                  child: FittedBox(
                    clipBehavior: Clip.antiAliasWithSaveLayer,
                    child: IconButton(
                      icon: const Icon(
                        Icons.add,
                      ),
                      onPressed: () {
                        cart.add(widget.product);
                      },
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
