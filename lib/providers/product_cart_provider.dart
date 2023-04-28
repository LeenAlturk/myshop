import 'package:flutter/cupertino.dart';

import '../models/productmodel.dart';
import '../services/productservices.dart';

class ProductViewModel extends ChangeNotifier {
  List<ProductModel> productLists = [];
  List<ProductModel> cartLists = [];
  var favorate = <ProductModel>[];
  bool isLoading = true;

  int get countCart => cartLists.length;
  double get totalPrice => cartLists.fold(
      0, (previousValue, element) => previousValue + element.price!);

  setLoading(bool loading) {
    isLoading = loading;
    notifyListeners();
  }

  Future<void> getAllProducts() async {
    var product = await AllproductsServices.getallProducts();
    if (product != null) {
      productLists = product;
      setLoading(false);
    }
  }

  addCart(ProductModel item) {
    cartLists.add(item);
    notifyListeners();
  }

  removeCart(ProductModel item) {
    cartLists.remove(item);
    notifyListeners();
  }

  clearCart() {
    cartLists.clear();
  }

  addtofav(ProductModel item) {
    favorate.add(item);
    notifyListeners();
  }
}
