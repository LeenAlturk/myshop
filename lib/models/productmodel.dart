import 'package:shop_app_with_cart/models/ratingmodel.dart';

class ProductModel {
  String? title;
  double? price;
  String? image;
  RatingModel? ratingModel;

  ProductModel({this.title, this.price, this.image, this.ratingModel});

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      title: json['title'],
      price: json['price'].toDouble(),
      image: json['image'],
      ratingModel: RatingModel.fromJson(json['rating']),
    );
  }
}
