import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:food_app/controller/shopping_card_controller.dart';
import 'package:food_app/model/product_model.dart';
import 'package:food_app/view/detail_screen.dart';
import 'package:get/get.dart';

class ShoppingCardScreen extends StatelessWidget {
  ShoppingCardScreen({super.key});
  final shoppingCard = Get.put(ShoppingCardController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ShoppingCardController>(builder: (context) {
      return Scaffold(
        appBar: AppBar(
          title: const Text('Shopping card'),
        ),
        body: ListView.builder(
          itemCount: shoppingCard.products.length,
          itemBuilder: (context, index) =>
              productItemList(shoppingCard.products[index]),
        ),
      );
    });
  }

  Widget productItemList(ProductModel pro) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(() => DetailScreen(pro: pro));
        },
        child: Container(
          height: 150,
          width: double.infinity,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Flexible(
                flex: 2,
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: NetworkImage(pro.image)))),
              ),
              Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      //  mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                pro.name,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                                style: const TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black),
                              ),
                              Text(
                                '\$${pro.price.toStringAsFixed(2)}',
                                // ignore: prefer_const_constructors
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.red),
                              )
                            ],
                          ),
                        ),
                        Flexible(
                          flex: 4,
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                const CircleAvatar(
                                  maxRadius: 18,
                                  child: Icon(Icons.remove),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text(
                                    pro.qty.toString(),
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.black),
                                  ),
                                ),
                                const CircleAvatar(
                                  maxRadius: 18,
                                  child: Icon(Icons.add),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
