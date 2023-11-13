import 'package:flutter/foundation.dart';
import 'package:kiso_nai_seconds/models/products.dart';

class ProductList extends ChangeNotifier{
  List <Product> productItmeList = [
    Product(
        productName: "key board",
        price: "550",
    ),

    Product(productName: "mouse",
        price: "1521"
    )
  ];
}