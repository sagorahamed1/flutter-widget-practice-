import 'package:flutter/material.dart';
import 'package:kiso_nai_seconds/models/product_list.dart';

class Product extends ChangeNotifier{
  String productName;
  String price;
  bool isFavorite;

  Product({
    required this.productName,
    required this.price,
     this.isFavorite = false,
  });

  togol(){
    isFavorite = !isFavorite;
    notifyListeners();
  }

  deleteProducts(int index){
    return ProductList().productItmeList.removeAt(index);
  }
}