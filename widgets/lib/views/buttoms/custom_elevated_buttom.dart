import 'package:flutter/material.dart';
import 'package:widgets/utils/app_colors.dart';

class CustomElevatedButtom extends StatelessWidget {

  final VoidCallback onpressed;
  final String titleText;
  final Color titleColor;
  final Color buttomColor;
  final double titleSize;
  final FontWeight titleWieight;
  final double buttonRadis;
  final double buttonHight;
  final double? buttonwidth;
  final TextAlign textAlign;

  CustomElevatedButtom({
    required this.onpressed,
    required this.titleText,
    this.titleColor = AppColors.whiteLight,
    this.buttomColor = AppColors.primaryColor,
    this.titleSize = 18,
    this.buttonHight = 56,
    this.buttonwidth,
    this.titleWieight = FontWeight.w600,
    this.buttonRadis = 8,
    this.textAlign = TextAlign.center



});


  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: buttonHight,
      width: buttonwidth,
      child: ElevatedButton(
          onPressed: onpressed,

          child: Text("Elevated")
      ),
    );
  }
}
