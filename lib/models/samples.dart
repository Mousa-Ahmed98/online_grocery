import 'package:online_grocery/providers/product_provider.dart';

class Item{
  String name;
  String imageUrl;
  Item(this.name, this.imageUrl);
}
class Samples{
  static final _items = [
    Item('Bakery', 'https://png.pngtree.com/png-clipart/20190516/original/pngtree-herb-flowers-bowl-png-image_4074509.jpg'),
    Item('Fast food', 'https://thumbs.dreamstime.com/b/shrimp-rosemary-lemon-plate-vector-illustrationin-cartoon-style-seafood-product-design-inhabitant-edible-sea-food-117443348.jpg'),
    Item('Fruits', 'https://cdn.picpng.com/strawberry/strawberry-fruit-vector-fruits-54087.png'),
    Item('Frozen Food', 'https://www.pngrepo.com/png/89395/512/frozen-yogurt.png'),
    Item('Herbs', 'https://png.pngtree.com/png-clipart/20190516/original/pngtree-herb-flowers-bowl-png-image_4074509.jpg'),
    Item('Dairy Food', 'https://www.pinclipart.com/picdir/middle/15-152233_dairy-clipart-dairy-food-alkaline-earth-metals-food.png'),
    Item('Meat', 'https://www.pngfind.com/pngs/m/1-14824_meat-cartoon-png-carne-cartoon-png-transparent-png.png'),
    Item('Vegetables', 'https://toppng.com/uploads/preview/safe-leafy-greens-chard-green-leafy-vegetable-11562965091f5m7pzcmbt.png'),
  ];

  static final _fruits = [
  ];



  static List<Item> get items{
    return _items;
  }

  static List<Product> getVegetablesList(){
    final List<Product> _items = [
      Product(
          price: 1.23,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F332F562F4853df4d-9756-49f8-8bf6-4a6fec26d21e2FCarrot.png',
          name: 'Carrots'),
      Product(
          price: 2.0,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F352F082F18b76060-c266-4a49-9688-29466dc7e4b62FCucumber.png',
          name: 'Cucumber'),
      Product(
          price: 1.23,
          catId: 'vegetables',
          imageUri: 'https://www.pngall.com/carrot-png',
          name: 'Broccoli'),
      Product(
          price: .86,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F322F472F9ff8af0d-ff7a-4f01-9276-434ad99ed6e32FAsparagus.png',
          name: 'Asparagus'),
      Product(
          price: 2.34,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F342F182F3c847c4a-ef7e-43d7-8f40-9c4bf76a84142FCauliflower.png',
          name: 'Cauliflower'),
      Product(
          price: 4.2,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F452F512Ff3c9fd20-63b4-44d0-9c07-d92ac720063d2FEggplant.png',
          name: 'Eggplant'),
      Product(
          price: 1.42,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F352F472F0e31173b-a6f0-4239-b26c-079a5366307c2FGreenPepper.png',
          name: 'Green pepper'),
      Product(
          price: 1.25,
          catId: 'vegetables',
          imageUri: '',
          name: ''),
      Product(
          price: 2.12,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F362F082Fa2168646-c824-429c-979a-709328996a012FLettuce.png',
          name: 'Lettuce'),
      Product(
          price: 3.12,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F362F282F6868f7e2-8c87-4eb2-9252-5441ef400cbb2FMushroom.png',
          name: 'Mushrooms'),
      Product(
          price: 1.56,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F362F492F08914cba-b6be-47b7-a63c-a53f4a475dd22FOnion.png',
          name: 'Onion'),
      Product(
          price: 1.82,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F372F052Ff4914bc1-0f03-49e6-8280-048fdbcee0a22FPotato1.png',
          name: 'Potato'),
      Product(
          price: 2.36,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F372F242F90b4131a-7d4d-4f81-9593-4078b1841e582FPumpkin.png',
          name: 'Pumpkin'),
      Product(
          price: 1.18,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F372F432Ffd899119-4f64-4ce9-88cb-fe892c8196cf2FRedPepper.png',
          name: 'Red pepper'),
      Product(
          price: 1.68,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F382F052Fc70f1e99-226b-47d1-81af-fc332586affa2FTomato1.png',
          name: 'Tomato'),
      Product(
          price: 1.26,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_583540669-300x281.jpg',
          name: 'Beetroot'),
      Product(
          price: 2.31,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1061990945-1-300x285.jpg',
          name: 'Brussel sprouts'),
      Product(
          price: 1.23,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1061990945-2-250x300.jpg',
          name: 'Peas'),
      Product(
          price: 1.53,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1061990945-3-285x300.jpg',
          name: 'Zucchini'),
      Product(
          price: 1.53,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_583540669-2-261x300.jpg',
          name: 'Radish'),
      Product(
          price: 1.53,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_180142271-1.jpg',
          name: 'Leek'),
      Product(
          price: .15,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_583540669-3-293x300.jpg',
          name: 'Cabbage'),
      Product(
          price: .64,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/chili-vegetables-in-english-english-for-kids-lingokids.png',
          name: 'Chili'),
      Product(
          price: .64,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_583540669-6-277x300.jpg',
          name: 'Garlic'),
    ];

    return _items;
  }
  static List<Product> setRandomProducts(){
    final List<Product> _items = [
      Product(
          price: 1.23,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F332F562F4853df4d-9756-49f8-8bf6-4a6fec26d21e2FCarrot.png',
          name: 'Carrots'),
      Product(
          price: 2.0,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F352F082F18b76060-c266-4a49-9688-29466dc7e4b62FCucumber.png',
          name: 'Cucumber'),
      Product(
          price: 1.10,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142F1976a7af-0290-4630-99b0-25bf1044173d2FLime.png',
          name: 'Lime'),
      Product(
          price: 1.33,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142Fae01d711-60fb-41e0-9c7a-aa2126e930a12FLemon.png',
          name: 'Lemon'),
      Product(
          price: .76,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142F6bd367ab-4d0d-4da6-a48d-99f0228c58112FCherries.png',
          name: 'Cherry'),
      Product(
          price: 1.04,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142F19f5c846-9bcd-4f7d-bbe5-fa75b4233f3a2FBlueberry.png',
          name: 'Blueberry'),
      Product(
          price: 4.2,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F452F512Ff3c9fd20-63b4-44d0-9c07-d92ac720063d2FEggplant.png',
          name: 'Eggplant'),
      Product(
          price: 1.42,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F352F472F0e31173b-a6f0-4239-b26c-079a5366307c2FGreenPepper.png',
          name: 'Green pepper'),
      Product(
          price: 1.04,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142F19f5c846-9bcd-4f7d-bbe5-fa75b4233f3a2FBlueberry.png',
          name: 'Blueberry'),
      Product(
          price: 2.12,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F362F082Fa2168646-c824-429c-979a-709328996a012FLettuce.png',
          name: 'Lettuce'),
      Product(
          price: 3.12,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F362F282F6868f7e2-8c87-4eb2-9252-5441ef400cbb2FMushroom.png',
          name: 'Mushrooms'),
      Product(
          price: 1.56,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F362F492F08914cba-b6be-47b7-a63c-a53f4a475dd22FOnion.png',
          name: 'Onion'),
      Product(
          price: 1.82,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F372F052Ff4914bc1-0f03-49e6-8280-048fdbcee0a22FPotato1.png',
          name: 'Potato'),
      Product(
          price: 2.36,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F372F242F90b4131a-7d4d-4f81-9593-4078b1841e582FPumpkin.png',
          name: 'Pumpkin'),
      Product(
          price: 1.18,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F372F432Ffd899119-4f64-4ce9-88cb-fe892c8196cf2FRedPepper.png',
          name: 'Red pepper'),
      Product(
          price: 1.68,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F262F142F382F052Fc70f1e99-226b-47d1-81af-fc332586affa2FTomato1.png',
          name: 'Tomato'),
      Product(
          price: 1.26,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_583540669-300x281.jpg',
          name: 'Beetroot'),
      Product(
          price: 2.31,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1061990945-1-300x285.jpg',
          name: 'Brussel sprouts'),
      Product(
          price: .76,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/milkshake1-2-150x150.png',
          name: 'Milk shake'),
      Product(
          price: 1.23,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1061990945-2-250x300.jpg',
          name: 'Peas'),
      Product(
          price: 1.53,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1061990945-3-285x300.jpg',
          name: 'Zucchini'),
      Product(
          price: 1.53,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_583540669-2-261x300.jpg',
          name: 'Radish'),
      Product(
          price: 1.10,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/cheeseburger-150x150.png',
          name: 'Cheeseburger'),
      Product(
          price: .15,
          catId: 'vegetables',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_583540669-3-293x300.jpg',
          name: 'Cabbage'),
      Product(
          price: 0.83,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/hamburger-150x150.png',
          name: 'Hamburger'),
      Product(
          price: 1.33,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/sandwich3-1-150x150.png',
          name: 'Sandwich'),

    ];

    return _items;
  }
  static List<Product> getFruitsList(){

    final List<Product> _fruits = [
      Product(
          price: 0.83,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142Fee0f7af7-92f9-4037-b0c3-41513145ff952FGrapes.png',
          name: 'Grapes'),
      Product(
          price: 1.10,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142F1976a7af-0290-4630-99b0-25bf1044173d2FLime.png',
          name: 'Lime'),
      Product(
          price: 1.33,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142Fae01d711-60fb-41e0-9c7a-aa2126e930a12FLemon.png',
          name: 'Lemon'),
      Product(
          price: .76,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142F6bd367ab-4d0d-4da6-a48d-99f0228c58112FCherries.png',
          name: 'Cherry'),
      Product(
          price: 1.04,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142F19f5c846-9bcd-4f7d-bbe5-fa75b4233f3a2FBlueberry.png',
          name: 'Blueberry'),
      Product(
          price: 2.24,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142Fa8b54aa7-ed88-4df7-8bf7-b3c22d2c57f32FBanana.pn',
          name: 'Banana'),
      Product(
          price: 1.40,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F142Fa77dbe0b-8cc2-48bb-b8c8-ef2944878e332FApple.png',
          name: 'Apple'),
      Product(
          price: 1.25,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F152Ff0f095ec-7514-47df-8795-26ba5e153c862FWatermelon.png',
          name: 'Watermelon'
      ),
      Product(
          price: 2.12,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F152F231a4254-7849-42cd-8c7b-bc6d979b738b2FPeach.png',
          name: 'Peach'),
      Product(
          price: 3.12,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F152F2303d0c1-0df9-48a8-a2ab-39b27fd14ca32FPineapple.png',
          name: 'Pineapple'),
      Product(
          price: 1.26,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F152Fd0ccc4bb-d13b-4bfc-9376-0eb115bf13002FStrawberry.png',
          name: 'Strawberry'),
      Product(
          price: 1.82,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20172F092F152F132F162F152Fb96f77f1-2d17-4c9b-987a-cbcf754640a12FOrangeFruit.png',
          name: 'Orange'),
      Product(
          price: 3.36,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20182F012F232F092F322F192F9d14a4e7-5b84-48be-8359-2f3a7282c90d2Fcoconut.png',
          name: 'Coconut'),
      Product(
          price: 5.18,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/11/20182F012F232F092F332F032Ff1d94929-170a-44d8-9f04-f29418c47ce82FPear.png',
          name: 'Pear'),
      Product(
          price: 2.68,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1666213684.jpg',
          name: 'Apricot'),
      Product(
          price: 1.26,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1666213684-1.jpg',
          name: 'Avocado'),
      Product(
          price: 2.31,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_492469993-265x300.jpg',
          name: 'Black berry'),
      Product(
          price: 1.23,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1666213684-2.jpg',
          name: 'Grapefruit'),
      Product(
          price: 1.53,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1666213684-3.jpg',
          name: 'Kiwi'),
      Product(
          price: 1.53,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1666213684-4.png',
          name: 'Mango'),
      Product(
          price: 1.53,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_492469993-5-221x300.jpg',
          name: 'Plum'),
      Product(
          price: .15,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1666213684-5.png',
          name: 'Raspberry'),
      Product(
          price: .64,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_1756701506-269x300.jpg',
          name: 'Pomegranate'),
      Product(
          price: .64,
          catId: 'fruits',
          imageUri: 'https://wp-cdn.lingokids.com/wp-content/uploads/2020/04/shutterstock_492469993-3.png',
          name: 'Fig'),
    ];
    return _fruits;
  }
  static List<Product> getFastFoodList(){

    final List<Product> _fastFood = [
      Product(
          price: 0.83,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/hamburger-150x150.png',
          name: 'Hamburger'),
      Product(
          price: 1.10,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/cheeseburger-150x150.png',
          name: 'Cheeseburger'),
      Product(
          price: 1.33,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/sandwich3-1-150x150.png',
          name: 'Sandwich'),
      Product(
          price: .76,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/milkshake1-2-150x150.png',
          name: 'Milk shake'),
      Product(
          price: 1.04,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/muffins-150x150.png',
          name: 'Muffin'),
      Product(
          price: 2.24,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/breakfast-burrito-150x150.png',
          name: 'Burrito'),
      Product(
          price: 1.40,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/biscuit-150x150.png',
          name: 'Biscuit'),
      Product(
          price: 1.25,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/taco-150x150.png',
          name: 'Taco'
      ),
      Product(
          price: 2.12,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/hot-dog-1-150x150.png',
          name: 'Hot dog'),
      Product(
          price: 3.12,
          catId: 'fastFood',
          imageUri: 'https://7esl.com/wp-content/uploads/2017/12/fried-chicken-150x150.png',
          name: 'Fired chicken'),
    ];
    return _fastFood;
  }

}