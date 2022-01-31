// ignore_for_file: curly_braces_in_flow_control_structures

import 'package:flutter/material.dart';
import 'package:online_grocery/providers/products_provider.dart';
import 'package:online_grocery/widgets/product_shop_widget.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsetsDirectional.only(start: 8, end: 8),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.all(1),
                      margin: const EdgeInsets.symmetric(vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: const InputDecoration(
                                hintText: 'Search octopus, egg, or etc.',
                                border: InputBorder.none,
                                contentPadding: EdgeInsets.only(left: 2),
                              ),
                              textAlign: TextAlign.start,
                              cursorColor: Colors.black,
                              onChanged: (value) {
                                if (value.isEmpty)
                                  Provider.of<ProductsProvider>(context,
                                          listen: false)
                                      .resetSearchItems();
                                else
                                  Provider.of<ProductsProvider>(context,
                                          listen: false)
                                      .searchWithSubString(value);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(5),
                            child: Icon(
                              Icons.search_outlined,
                              color: Colors.grey[600],
                              size: 30,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Consumer<ProductsProvider>(
                    builder: (context, product, child) => GridView.builder(
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: const ScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithMaxCrossAxisExtent(
                        maxCrossAxisExtent: 300,
                        childAspectRatio: 2.1 / 3,
                        crossAxisSpacing: 10,
                        mainAxisExtent: 250,
                        mainAxisSpacing: 1,
                      ),
                      itemCount: product.searchItems.length,
                      itemBuilder: (context, index) => ProductShopWidget(
                          product: product.searchItems[index]),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Align(
                alignment: AlignmentDirectional.bottomStart,
                child: FloatingActionButton(
                  onPressed: () {
                    Provider.of<ProductsProvider>(context, listen: false)
                        .resetSearchItems();
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
