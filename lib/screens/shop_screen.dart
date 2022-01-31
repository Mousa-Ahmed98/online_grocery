import 'package:flutter/material.dart';
import 'package:online_grocery/models/samples.dart';
import 'package:online_grocery/providers/products_provider.dart';
import 'package:online_grocery/screens/category_overview_screen.dart';
import 'package:online_grocery/widgets/product_shop_widget.dart';
import 'package:provider/provider.dart';

import 'search_screen.dart';

class ShopScreen extends StatefulWidget {
  const ShopScreen({Key? key}) : super(key: key);

  @override
  _ShopScreenState createState() => _ShopScreenState();
}

class _ShopScreenState extends State<ShopScreen> {

  String searchKey = '';

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var pro = Provider.of<ProductsProvider>(context, listen: true);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: searchKey.isEmpty? Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSearchBar(context),
              const Divider(
                height: 6,
                color: Colors.black,
              ),
              buildUserBriefView(context),
              const Divider(
                height: 10,
                color: Colors.black,
              ),
              buildCategoriesGrid(),
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Pick\'s Today',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              if(pro.randomItems.isNotEmpty)
              Consumer<ProductsProvider>(
                builder: (context, value, child) => buildProductsShopGridView(context, value.randomItems),
              ),
              const SizedBox(height: 10,),
              if(pro.randomItems.isEmpty)
                const Center(child: CircularProgressIndicator(),)
            ],
          ) : pro.searchItems.isEmpty? const Center(child: CircularProgressIndicator())
              : ListView.separated(
              itemBuilder: (context, index) => ProductShopWidget(
                  product: pro.searchItems[index],
              ),
              separatorBuilder: (context, index) => const SizedBox(height: 10,),
              itemCount: pro.searchItems.length,
          ),
        ),
      ),
    );
  }

  Widget buildProductsShopGridView(BuildContext context, items) {
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
                  itemCount: items.length>16? 16 : items.length,
                  itemBuilder: (context, index) =>
                      ProductShopWidget(product: items[index]),

    );
  }

  Padding buildCategoriesGrid() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Categories',
            style:
            TextStyle(color: Theme
                .of(context)
                .primaryColor, fontSize: 15),
          ),
          const SizedBox(
            height: 5,
          ),
          GridView.builder(
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: const ScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 100,
              childAspectRatio: 2 / 3,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: Samples.items.length,
            itemBuilder: (BuildContext context, int index) {
              return Column(children: [
                InkWell(
                  onTap: () {
                    openCategoriesScreenWithCategory(Samples.items[index].name);
                  },
                  child: Container(
                    color: Colors.white,
                    width: 80,
                    height: 80,
                    child: ClipRRect(
                      child: FadeInImage(
                        image: NetworkImage(
                          Samples.items[index].imageUrl,
                        ),
                        placeholder:
                        const AssetImage('assets/images/playstore.png'),
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Text(
                  Samples.items[index].name,
                  style: const TextStyle(color: Colors.black, fontSize: 14),
                ),
              ]);
            },
          ),
        ],
      ),
    );
  }

  Padding buildUserBriefView(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        verticalDirection: VerticalDirection.down,
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            width: 80,
            height: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Image.asset(
                'assets/images/playstore.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Hi Mousa, time for shopping',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                'Milk, broccoli and +9 others',
                style: TextStyle(
                  color: Colors.grey[700],
                ),
              ),
            ],
          ),
          Column(
            children: const [
              SizedBox(
                height: 40,
              ),
              /*TextButton(
                child: Text(
                  'Order Again',
                  style: TextStyle(color: Theme
                      .of(context)
                      .primaryColor),
                  textAlign: TextAlign.justify,
                  softWrap: true,
                ),
                onPressed: () {
                  //Provider.of<Products>(context, listen:  false).setRandomProducts();
                },
              ),*/
            ],
          )
        ],
      ),
    );
  }

  SizedBox buildSearchBar(BuildContext context) {
    return SizedBox(
      height: 80,
      child: Row(
        children: [
          const SizedBox(
            width: 10,
          ),
          Expanded(
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
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => const SearchScreen(),
                        ));
                      },
                      child: const Padding(
                        padding: EdgeInsetsDirectional.only(start: 4),
                        child: Text(
                          'Search octopus, egg, or etc.',
                        ),
                      ),
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
          const SizedBox(
            width: 10,
          ),
          Icon(
            Icons.circle_notifications,
            color: Theme
                .of(context)
                .primaryColor,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
        ],
      ),
    );
  }

  void openCategoriesScreenWithCategory(String name) {

    Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 400),
          pageBuilder: (context, animation, secondaryAnimation) => CategoryOverviewScreen(catName: name,),
          transitionsBuilder: (context, animation, secondaryAnimation,
              child) {
            animation = CurvedAnimation(parent: animation, curve: Curves.fastLinearToSlowEaseIn);
            return ScaleTransition(
              alignment: Alignment.center,
              scale: animation,
              child: child,
            );
          },
        )
    );
  }
}
