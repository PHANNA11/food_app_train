import 'package:food_app/model/product_model.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/state_manager.dart';

class ShoppingCardController extends GetxController {
  RxList<ProductModel> products = <ProductModel>[].obs;
  void addToCard(ProductModel pro) async {
    products.add(pro);
    update();
  }
}
