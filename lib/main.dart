import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_app_with_cart/providers/product_cart_provider.dart';

import 'package:shop_app_with_cart/screens/home_page.dart';

void main() {
  Provider.debugCheckInvalidValueType = null;
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //note of multi prov
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<ProductViewModel>(
            create: (context) => ProductViewModel())
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.grey,
        ),
        home: MyHomePage(),
      ),
    );
  }
}
