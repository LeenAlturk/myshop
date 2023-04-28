import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_with_cart/widgets/products.dart';

import '../providers/product_cart_provider.dart';
import '../widgets/buttonnavigationbat.dart';
import 'cart.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var productViewModel;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    productViewModel = Provider.of<ProductViewModel>(context, listen: false);
    productViewModel.getAllProducts();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Bottom(currentIndex: 0),
            appBar: AppBar(
              title: Text("Wellcome Dear customer"),
              actions: [
                Consumer<ProductViewModel>(builder: (context, data1, child) {
                  return InkWell(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => CartPage()));
                    },
                    child: Container(
                      padding: EdgeInsets.all(8),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.shopping_cart),
                          Text(data1.countCart.toString())
                        ],
                      ),
                    ),
                  );
                })
              ],
            ),
            body: Consumer<ProductViewModel>(builder: (context, data, child) {
              return data.isLoading
                  ? const Center(
                      child: CircularProgressIndicator(
                        color: Colors.blue,
                      ),
                    )
                  : ListView.builder(
                      itemCount: data.productLists.length,
                      itemBuilder: (context, index) {
                        return Products(
                          imgUrl: data.productLists[index].image!,
                          title: data.productLists[index].title!,
                          price: data.productLists[index].price!,
                          rating: data.productLists[index].ratingModel!.rate!,
                          prdductmodel: productViewModel,
                          index: index,
                        );
                      });
            })));
  }
}
