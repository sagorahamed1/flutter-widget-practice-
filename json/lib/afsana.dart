import 'package:flutter/material.dart';

class CalculateBmi extends StatefulWidget {
  const CalculateBmi({super.key});

  @override
  State<CalculateBmi> createState() => _CalculateBmiState();
}

class _CalculateBmiState extends State<CalculateBmi> {
  dynamic totalBmi = 0;
  dynamic newBmi = 0;
  int bmiNumber =0 ;
  String bmiStatus = "";
  TextEditingController age = TextEditingController();
  TextEditingController weight = TextEditingController();
  TextEditingController height =TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculate your BMI', style: TextStyle(
            fontSize: 23, fontWeight: FontWeight.w700,color: Colors.blueAccent
        ),),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(155, 0, 0, 0),
            child: TextField(
              controller: age,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                border: InputBorder.none,
                hintText: 'age',

              ),
            ),
          ),
          //Age section done

          Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: TextField(
              controller: weight,
              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Weight'
              ),
            ),
          ),
          //Weight section done

          Padding(
            padding: const EdgeInsets.fromLTRB(150, 0, 0, 0),
            child: TextField(
              controller: height,

              keyboardType: TextInputType.number,
              autofocus: true,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Height in CM'
              ),
            ),
          ),

          //height section done
          TextButton(
            onPressed: (){
              setState(() {
                newBmi =(double.parse(weight.text))/
                    (( double.parse(height.text))*( double.parse(height.text)));
                totalBmi =newBmi*10000;

                if(totalBmi < 18.50){
                  bmiStatus = "You BMI is Underweight";
                }
                else if (totalBmi > 18.5 && totalBmi <= 24.9){
                  bmiStatus = "Congratution! your featness is good";
                }
                else if(totalBmi > 24.9 && totalBmi <= 39.9){
                  bmiStatus = "Your weight is Overweight";
                }
                else{
                  bmiStatus = "Obese";
                }
              });
            },
            child: const Text('Display results'),
          ),
          Text("Your BMI is :$totalBmi"),
          Text("Your helath update is: $bmiStatus")
        ],
      ),
    );
  }
}