
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constant.dart';

class CustomButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final double button_text_fontSize,button_height;
  const CustomButton({
    super.key,
    required this.onTap,
    required this.text,
    required this.button_text_fontSize,
    required this.button_height,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: button_height,
        width: double.infinity,
        decoration: BoxDecoration(
       //   color: Color(0xffffa152),
          color: custombuttoncollor,
          borderRadius: BorderRadius.circular(22),
        ),
        child: Center(
          child: Text(
            text,
            style:  GoogleFonts.roboto(
                color: figma_white, fontWeight: FontWeight.w600, fontSize: button_text_fontSize),
          ),
        ),
      ),
    );
  }
}