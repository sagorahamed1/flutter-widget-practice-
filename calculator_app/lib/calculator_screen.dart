import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  String userInput = "";
  String result = "0";

  // list of buttoms
  List buttomlist = [
    "AC",
    "Back",
    "%",
    "/",
    "7",
    "8",
    "9",
    "*",
    "4",
    "5",
    "6",
    "-",
    "1",
    "2",
    "3",
    "+",
    "0",
    "00",
    ".",
    "=",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(elevation: 0.0,),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        color: const Color(0xFF151515),
        child: Column(
          children: [
            SizedBox(
              height: 220,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Align(
                      alignment: Alignment.bottomRight,
                      child: Text(userInput, style: const TextStyle(color: Colors.white, fontSize: 36),)),

                  const SizedBox(height: 23,),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Text(result, style: const TextStyle(color: Colors.white70, fontSize: 40),),
                  )
                ],
              ),
            ),

            const Divider(color: Colors.white24),
            Expanded(
              child: Container(
                margin: const EdgeInsets.only(left: 5, right: 5),
                child: GridView.builder(
                    itemCount: buttomlist.length,
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        childAspectRatio: 10/10.5,
                        crossAxisCount: 4),
                    itemBuilder: (context, index) {
                      return custombuttom(buttomlist[index]);
                    },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  //custombuttom for all buttom!
  Widget custombuttom (String index){
    return InkWell(
      onTap: (){
        setState(() {
          buttomHandel(index);
        });
      },
      child: Ink(
        child: Container(
          margin: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: getBgColors(index),
            borderRadius: BorderRadius.circular(20),
            boxShadow: const [BoxShadow(
              blurRadius: 10,
              spreadRadius: -5,
              offset: Offset(-3,-2),
            )]
          ),
          child: Center(
              child: Text(index, style: TextStyle(
                  fontSize: 30, color: getColor(index)),)),
        ),
      ),
    );
  }

  //buttom letter color
  getColor(String index){
    if(index == "Back" || index == "%" || index == "/" || index == "*" || index == "-" || index == "+"){
      return Colors.green;
    }
    return Colors.white;
  }

  // buttom background colors
  getBgColors (String index){
    if(index == "AC"){
      return Colors.redAccent;
    }
    else if(index == "="){
      return Colors.green;
    }
    return const Color(0xFF343440);
  }

// function all buttom
  buttomHandel(String index){
    if(index == "AC"){
      userInput = "";
      result = "0";
      return;
    }
    if(index == "Back"){
      if(userInput.isNotEmpty){
       userInput = userInput.substring(0, userInput.length - 1);
        return;
      }
      return null;
    }
    if(index == "="){
      result = fnOfCalculator();
      userInput = result;
        if (result.endsWith(".0")){
          result = result.replaceAll(".0", "");

        if(userInput.endsWith(".0"))
          userInput = userInput.replaceAll(".0", "");
          return;
        }
    }
    userInput = userInput+index;
  }

  // calculator functional math expreession;
  String fnOfCalculator(){
    try{
      var exp = Parser().parse(userInput);
      var evelaition = exp.evaluate(EvaluationType.REAL, ContextModel());
      return evelaition.toString();
    }catch(e){
      return "Invalid";
    }
  }
}
