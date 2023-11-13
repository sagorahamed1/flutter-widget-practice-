import 'package:flutter/material.dart';
import 'package:kiso_nai_seconds/models/products.dart';
import 'package:provider/provider.dart';

class ProductLists extends StatelessWidget {
  const ProductLists({super.key});

  @override
  Widget build(BuildContext context) {
    var produc = Provider.of<Product>(context);
    return Card(
      child: ListTile(
        title: Text(produc.productName),
        subtitle: Text(produc.price),
        trailing: IconButton(
          onPressed: () {
            produc.togol(); // Corrected the method name
          },
          icon: produc.isFavorite
              ? Icon(Icons.favorite)
              : Icon(Icons.favorite_border),
        ),
        leading: IconButton(onPressed: (){
           produc.deleteProducts;
          }, icon: Icon(Icons.delete),
        )
      ),
    );
  }
}
