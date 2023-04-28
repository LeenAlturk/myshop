import 'dart:convert';

import 'package:http/http.dart';

import 'package:http/http.dart' as http;

import '../helpers/api.dart';
import '../models/productmodel.dart';

class AllproductsServices {
  static Future<List<ProductModel>> getallProducts() async {
    //make a requist
    List<dynamic> data =
        await Api().get(url: 'https://fakestoreapi.com/products');
    //decode the response that return list od dynamic

    List<ProductModel> productList = [];
    //take the list and make a loop
    for (int i = 0; i < data.length; i++) {
      //everytime i get the value from the list and make decode that mean convert it to ProductModel and store it in productList
      productList.add(
        ProductModel.fromJson(data[i]),
      );
    }
    return productList;
  }
}
