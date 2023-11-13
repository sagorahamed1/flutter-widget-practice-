import 'package:flutter/material.dart';
import 'package:kiso_nai_seconds/models/product_list.dart';
import 'package:kiso_nai_seconds/models/products.dart';
import 'package:kiso_nai_seconds/widgets/productList.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final productDates = Provider.of<ProductList>(context);
    final productdata = productDates.productItmeList;

    return Scaffold(
      body: ListView.builder(
        itemCount: productdata.length,
        itemBuilder: (context, index) => ChangeNotifierProvider<Product>(
          create: (context) => productdata[index], // Assuming productdata is a list of Product
          child: ProductLists(),
        ),
      ),
    );
  }
}