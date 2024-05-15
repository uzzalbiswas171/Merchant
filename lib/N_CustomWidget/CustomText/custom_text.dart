
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  CustomText({super.key,required this.text,required this.fontSize,required this.fontWeight,this.color,this.maxLines,this.letterSpacing});
  String text;
  double fontSize;
  double ? letterSpacing;
  final FontWeight fontWeight;
  final Color? color;
  final int? maxLines;
  @override
  Widget build(BuildContext context) {
    return Text(
      overflow: TextOverflow.ellipsis,
      maxLines: maxLines,
      "$text",
      style: GoogleFonts.roboto(
          fontSize: fontSize,
          fontWeight: fontWeight,
          color:color,
        letterSpacing: letterSpacing,
      ),
    );
  }
}


