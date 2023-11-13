import 'dart:convert';
import 'package:dart_practice/person_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


void main ()=> runApp(MyApp());

class MyApp extends StatelessWidget{
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: HomeActivity(),
   );
  }
}

class HomeActivity extends StatefulWidget {
  const HomeActivity({super.key});

  @override
  State<HomeActivity> createState() => _HomeActivityState();
}

class _HomeActivityState extends State<HomeActivity> {

 Future getpersondata(){

   List <Person> persons = [];

    final listss = rootBundle.loadString("assets/person_file.json");
    List <dynamic> personjsonString = jsonDecode(listss.toString());

      for(var person in personjsonString){

          var personsss = Person(name: person['name'], title: person["title"]);
       persons.add(personsss);
      }
      return persons;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: personlist.length,
          itemBuilder: (context, index) {
            return Card(
              child: GestureDetector(
                child: ListTile(
                  title: Text("${personlist[index].name}"),
                  subtitle: Text("${personlist[index].title}"),
                ),
              ),
            );
          },),
    );
  }
}


