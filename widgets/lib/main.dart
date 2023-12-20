import 'package:flutter/material.dart';
import 'package:widgets/utils/app_colors.dart';
import 'package:widgets/views/buttoms/bottom_nab.dart';
import 'package:widgets/views/buttoms/custom_back.dart';
import 'package:widgets/views/buttoms/custom_elevated_buttom.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Center(
        child: Column(
          children: [
            CustomBack(),
            CustomElevatedButtom(onpressed: (){}, titleText: "ss"),
            Spacer(),
            BottomNavButton(onTap: (){}, buttonColor: AppColors.greenNormal, buttonName: "Sagor",)
          ],
        ),
      ),
    );
  }
}

