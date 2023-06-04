import 'package:flutter/material.dart';
import 'package:food_app/view/detail_screen.dart';

import '../model/product_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: GridView.count(
          childAspectRatio: 14 / 19,
          crossAxisCount: 2,
          children: List.generate(
              products.length, (index) => buidItem(products[index]))),
    );
  }

  Widget buidItem(ProductModel pro) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => DetailScreen(pro: pro),
            ));
      },
      child: Padding(
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
                          fit: BoxFit.cover, image: NetworkImage(pro.image))),
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
                        style: TextStyle(
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
    );
  }
}
