import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../providers/product_cart_provider.dart';

class Products extends StatelessWidget {
  const Products(
      {super.key,
      required this.imgUrl,
      required this.title,
      required this.price,
      required this.rating,
      required this.prdductmodel,
      required this.index});
  final String imgUrl, title;
  final double price, rating;
  final ProductViewModel prdductmodel;
  final int index;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            height: 200,
            width: 400,
            decoration: BoxDecoration(
                image: DecorationImage(
              image: NetworkImage(imgUrl),
              //fit: BoxFit.cover
            )),
          ),
          Container(
              child: Row(
            children: <Widget>[
              Expanded(
                  child: Text(
                title,
                style: TextStyle(fontSize: 20),
              )),
              Container(
                  padding: EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: Colors.yellow,
                      borderRadius: BorderRadius.circular(16)),
                  child: Text(
                    rating.toString(),
                    style: TextStyle(fontSize: 14),
                  )),
            ],
          )),
          Row(
            children: [
              Text(
                "price: " + price.toString(),
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              IconButton(onPressed: () {}, icon: Icon(Icons.favorite_border))
            ],
          ),
          prdductmodel.cartLists.contains(prdductmodel.productLists[index])
              ? ElevatedButton(
                  onPressed: () {
                    prdductmodel.removeCart(prdductmodel.productLists[index]);
                  },
                  child: Text("Added"))
              : ElevatedButton(
                  onPressed: () {
                    prdductmodel.addCart(prdductmodel.productLists[index]);
                  },
                  child: Text("Add to cart"))
        ],
      ),
    );
  }
}
