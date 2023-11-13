import 'dart:convert';
import 'dart:js_interop';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:json/persons.dart';

class PersonHomePage extends StatefulWidget {
  const PersonHomePage({super.key});

  @override
  State<PersonHomePage> createState() => _PersonHomePageState();
}

class _PersonHomePageState extends State<PersonHomePage> {

  List assetefiledata = [];
  Future <String> loadString () async{
    return await rootBundle.loadString("assets/file.json");
  }

  getpersonlistString (){
    final data = loadString();
    data.then((value) {
      var jsondata = jsonDecode(value);

      List <Person> list = [];
      for(var map in jsondata){
          list.add(Person(name: map['name'], title: map['title']));
      }
      setState(() {
         assetefiledata = list;
      });
    });
  }
  @override
  void initState() {
    super.initState();
    getpersonlistString();
  }

  // Future <List<Person>> getpersondata ()async{
  //
  //   final fileName = await rootBundle.loadString("assets/file.json");
  //   List <dynamic> personListString = jsonDecode(fileName);
  //
  //   List <Person> personsListData = [];
  //   for(var person in personListString){
  //     var personss = Person(name: person['name'], title: person["title"]);
  //     personsListData.add(personss);
  //   }
  //   return personsListData;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
         itemCount: assetefiledata.length,
          itemBuilder: (context, index) {
           if(assetefiledata.isEmpty){
             return CircularProgressIndicator();
           }
           return InkWell(
             onTap: (){
               Navigator.pushNamed(context, "/scecondPage");
             },
             child: ListTile(
               title: Text("${assetefiledata[index].name}"),
               subtitle: Text("${assetefiledata[index].title}"),
               leading: CircleAvatar(
                 backgroundColor: Colors.green,
                 child: Text("${assetefiledata[index].name[0]}"),
               ),
             ),
           );
          },
      ),
    );
  }
}
