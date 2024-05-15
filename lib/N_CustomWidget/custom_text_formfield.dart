
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../N_View/Auth/Login/utils/text_utils.dart';




class CustomTextFormFieldd extends StatefulWidget {
  CustomTextFormFieldd({super.key,
    required this.maxline,
    required this.height,
    required this.hintext,
    required this.controller,
    required this.obscureText,
    required this.keyboardType,
    required this.onChanged,
    this.suffix,
    required this.readOnly,


  });

  String ?  hintext;
  int ? maxline;
  double ?height;
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  late bool obscureText;
  bool readOnly;
  Widget? suffix;
  TextInputType? keyboardType;
  @override
  State<CustomTextFormFieldd> createState() => _CustomTextFormFielddState();
}


class _CustomTextFormFielddState extends State<CustomTextFormFieldd> {

  @override
  Widget build(BuildContext context) {

    return Container(
      height: widget.height,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
        color: TextFieldColor,
      ),
      alignment: Alignment.center,
      child: TextFormField(
        readOnly: widget.readOnly,
        keyboardType:widget.keyboardType,
        obscureText: widget.obscureText,
        onChanged: widget.onChanged,
        validator: (value) {
          if (value!.isEmpty) {
            return "${widget.hintext} can not be empty";
          } else {
            return null;
          }
        },
        // final TextEditingController? controller;
        controller: widget.controller,
        maxLines: widget.maxline,
        decoration: InputDecoration(
            prefixIcon: widget.suffix,
            hintStyle: GoogleFonts.urbanist(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.2
            ),
border: InputBorder.none,

          //  hintText: "${widget.hintext}",
            errorStyle: TextStyle(
              fontSize: 0.1,
            ),
            contentPadding: EdgeInsets.only(left:5,right: 0,top: 0,bottom: 7),

        ),
      ),
    );
  }
}



class CustomTextfieldForm extends StatelessWidget {
  CustomTextfieldForm({super.key,required this.name,required this.controller,required this.obscureText,this.keyboardType});
  String name;
  final TextEditingController? controller;
  late bool obscureText;
  TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
       TextUtil(text: "$name",),
        CustomTextFormFieldd(
          readOnly: false,
          maxline: 1, height: 52, hintext: "$name", controller: controller, obscureText: obscureText, keyboardType: keyboardType, onChanged: (value) {

        },),
        SizedBox(height: 10,),
      ],
    );
  }
}

