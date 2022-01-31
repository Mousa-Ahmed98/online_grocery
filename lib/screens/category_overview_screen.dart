import 'package:flutter/material.dart';
import 'package:online_grocery/providers/cart_provider.dart';
import 'package:online_grocery/providers/products_provider.dart';
import 'package:online_grocery/screens/cart_screen.dart';
import 'package:online_grocery/screens/home_screen.dart';
import 'package:online_grocery/widgets/badge.dart';
import 'package:online_grocery/widgets/product_shop_widget.dart';
import 'package:provider/provider.dart';

class CategoryOverviewScreen extends StatefulWidget {
  final catName;

  const CategoryOverviewScreen({Key? key, required this.catName})
      : super(key: key);

  @override
  _CategoryOverViewScreenState createState() => _CategoryOverViewScreenState();
}

class _CategoryOverViewScreenState extends State<CategoryOverviewScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          '${widget.catName}',
        ),
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          Consumer<CartProvider>(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(Icons.shopping_cart),
                color: Colors.white,
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const CartScreen(),));
                },
              ),
            ),
            builder: (context, cart, ch) => Badge(
              value: cart.items.length.toString(),
              child: ch!,
            ),
          )
        ],
      ),
      body: buildProductsShopGridView(context),
    );
  }

  Future<void> _refreshProducts(BuildContext context, name) async {
    if (name == 'Vegetables') {
      Provider.of<ProductsProvider>(context, listen: true).vItems;
    }
    if (name == 'Fruits') {
      Provider.of<ProductsProvider>(context, listen: true).fItems;
    }
    if (name == 'Fast food') {
      Provider.of<ProductsProvider>(context, listen: true).fastItems;
    }
  }

  Widget buildProductsShopGridView(BuildContext context) {
    return Consumer<ProductsProvider>(
        builder: (context, productsData, child) {

          return productsData.getSpecificItemsList(widget.catName).isEmpty
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).primaryColor,
                ),
              )
            : GridView.builder(
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
                itemCount: widget.catName == 'Vegetables'? productsData.getSpecificItemsList(widget.catName).length :
                          widget.catName == 'Fast food'? productsData.getSpecificItemsList(widget.catName).length :
                          productsData.getSpecificItemsList(widget.catName).length,
                itemBuilder: (context, index) =>
                    ProductShopWidget(product: widget.catName == 'Vegetables'? productsData.getSpecificItemsList(widget.catName)[index] :
                    widget.catName == 'Fast food'? productsData.getSpecificItemsList(widget.catName)[index] :
                    productsData.getSpecificItemsList(widget.catName)[index]),
              );
        },
    );
  }
}
