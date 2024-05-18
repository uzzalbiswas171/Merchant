
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';

import '../CustomText/custom_text.dart';

class SelectionOptionsScreen extends StatelessWidget {
 SelectionOptionsScreen({super.key,this.leftText, this.rite_text});
  String ? leftText,rite_text;
  @override
  Widget build(BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    double h = MediaQuery.of(context).size.height;
    return  Container(
      width: w * 0.95,
      child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
           CustomText(text: "$leftText", fontSize: 22, fontWeight: FontWeight.bold),
           CustomText(text: "$rite_text", fontSize: 16, fontWeight: FontWeight.w600,color: redColor),
          ]),
    );
  }
}
