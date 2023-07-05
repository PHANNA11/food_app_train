import 'package:flutter/material.dart';
import 'package:food_app/controller/shopping_card_controller.dart';
import 'package:food_app/view/detail_screen.dart';
import 'package:badges/badges.dart' as badges;
import 'package:food_app/view/shopping_card_screen.dart';
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
    return GetBuilder<ShoppingCardController>(
        init: shoppingCard,
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text(widget.title),
              actions: [
                Center(
                  child: GestureDetector(
                    onTap: () {
                      Get.to(() => ShoppingCardScreen());
                    },
                    child: badges.Badge(
                      showBadge: shoppingCard.products.isEmpty ? false : true,
                      badgeContent:
                          Text(shoppingCard.products.length.toString()),
                      child: const Icon(Icons.shopping_cart),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 30,
                )
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
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Hero(
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
          ),
          Positioned(
              bottom: 50,
              right: 10,
              child: GestureDetector(
                onTap: () async {
                  shoppingCard.addToCard(pro);
                },
                child: const CircleAvatar(
                  child: Center(
                    child: Icon(Icons.shopping_cart),
                  ),
                ),
              ))
        ],
      ),
    );
  }
}
