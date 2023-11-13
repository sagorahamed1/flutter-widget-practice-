import 'package:flutter/material.dart';
import 'package:kiso_nai/person.dart';

class PersonDetailsPage extends StatelessWidget {
  Person person;
  PersonDetailsPage({super.key, required this.person});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${person.name}"),
          Text("${person.title}")
        ],
      ),
    );
  }
}
