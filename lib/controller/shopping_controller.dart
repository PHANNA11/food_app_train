import 'package:food_app/model/product_model.dart';
import 'package:get/state_manager.dart';

class ShoppingCardController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;

  void addToCard(ProductModel pro) {
    if (products.isNotEmpty) {
      if (products.every((element) => element.code != pro.code)) {
        products.add(pro);
        //  grandTotal += fruitModel.total();
      } else {
        products[products.indexWhere((element) => element.code == pro.code)]
            .qty++;
      }
    } else {
      products.add(pro);
    }
    // calculateGrandTotal();
    update();
  }
}
