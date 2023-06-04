import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:food_app/model/product_model.dart';

class DetailScreen extends StatefulWidget {
  DetailScreen({Key? key, required this.pro}) : super(key: key);
  ProductModel pro;
  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pro.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Hero(
                tag: widget.pro.code.toString(),
                child: Image(image: NetworkImage(widget.pro.image))),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pro.price.toString(),
                  style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    child: Icon(Icons.share),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  CircleAvatar(
                    child: Icon(Icons.favorite),
                  )
                ],
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  widget.pro.name.toString(),
                  style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Colors.red),
                ),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 20, top: 8, bottom: 8, right: 8),
                  child: Text('Instock'.toUpperCase()),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: const [
                  Text(
                    '1 review ',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text('|',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Icon(
                    Icons.star,
                    color: Colors.red,
                  ),
                  Text('4.5',
                      style:
                          TextStyle(fontSize: 16, fontWeight: FontWeight.bold))
                ],
              ),
            ),
            SizedBox(
              height: 80,
              width: double.infinity,
              child: ListView.builder(
                itemCount: widget.pro.ItemAddOn.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  var item = widget.pro.ItemAddOn[index];
                  return buildItemAddOn(item);
                },
              ),
            ),
            const Card(
              elevation: 0,
              child: ListTile(
                title: Text('Color & Size'),
              ),
            ),
            Card(
              elevation: 0,
              child: ExpansionTile(
                title: const Text('Item Description'),
                children: [Text(widget.pro.description)],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget buildItemAddOn(String imageURL) {
    return Card(
      child: SizedBox(
        height: 70,
        width: 70,
        child: Image(fit: BoxFit.cover, image: NetworkImage(imageURL)),
        //color: Colors.blue,
      ),
    );
  }
}
