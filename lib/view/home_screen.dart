import 'package:flutter/material.dart';
import 'package:food_app/controller/shopping_controller.dart';
import 'package:food_app/language/view/language_screen.dart';
import 'package:food_app/view/detail_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:food_app/view/shopping_screen.dart';
import 'package:get/get.dart';
import '../model/product_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final shoppingCard = Get.put(ShoppingCardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCardController>(builder: (contexts) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [
            Center(
              child: GestureDetector(
                onTap: () => Get.to(() => ShoppingScreen()),
                child: badges.Badge(
                  showBadge: shoppingCard.products.isEmpty ? false : true,
                  badgeContent: Text(shoppingCard.products.length.toString()),
                  child: const Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                  onPressed: () => Get.to((LanguageScreen())),
                  icon: Icon(
                    Icons.settings,
                    size: 30,
                  )),
            ),
            const SizedBox(
              width: 20,
            ),
          ],
        ),
        body: GridView.count(
            childAspectRatio: 14 / 19,
            crossAxisCount: 2,
            children: List.generate(
                products.length, (index) => buidItem(products[index]))),
      );
    });
  }

  Widget buidItem(ProductModel pro) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(pro: pro),
            ));
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Stack(
          children: [
            Hero(
              tag: pro.code.toString(),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.blue,
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(15),
                              topRight: Radius.circular(15)),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(pro.image))),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Text(
                            pro.name,
                            style: const TextStyle(
                                fontSize: 16, fontWeight: FontWeight.bold),
                            overflow: TextOverflow.ellipsis,
                            maxLines: 2,
                          ),
                        ),
                        Text('${pro.price} \$',
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.red))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Positioned(
                bottom: 40,
                right: 0,
                child: GestureDetector(
                  onTap: () {
                    shoppingCard.addToCard(pro);
                  },
                  child: Container(
                    height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                        color: Colors.white, shape: BoxShape.circle),
                    child: Icon(Icons.shopping_cart),
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
