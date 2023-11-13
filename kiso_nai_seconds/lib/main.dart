

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kiso_nai_seconds/models/product_list.dart';
import 'package:kiso_nai_seconds/pages/home_page.dart';
import 'package:provider/provider.dart';

void main()=> runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context)=> ProductList(),
       child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
