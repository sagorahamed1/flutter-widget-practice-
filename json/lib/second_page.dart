import 'package:flutter/material.dart';

class ScecondPage extends StatelessWidget {
  const ScecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: 300,
        width: 300,
        color: Colors.green,
        child: GestureDetector(
          onTap: (){

          },
          child: Text("Back"),
        ),
      ),
    );
  }
}
