import 'package:food_app/model/product_model.dart';
import 'package:get/state_manager.dart';

class ShoppingCardController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  void addToCard(ProductModel pro) {
    products.add(pro);
    update();
  }
}
