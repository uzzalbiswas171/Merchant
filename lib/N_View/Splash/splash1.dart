import 'package:e_currier/CustomButton/custom_button.dart';
import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_View/Splash/splash2.dart';
import 'package:e_currier/N_View/Splash/splash3.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen1 extends StatefulWidget {
  const SplashScreen1({super.key});

  @override
  State<SplashScreen1> createState() => _SplashScreen1State();
}

class _SplashScreen1State extends State<SplashScreen1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(15),
        child: Column(
          children: [
            Expanded(child:Container(
              margin:  EdgeInsets.only(left: 15,right: 15,top: MediaQuery.of(context).size.height/3.3),
              child: Image(image: AssetImage("assets/all over 1.png"),height: 143,width: 326,fit: BoxFit.fill,),
            ),),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 26),
                    height: 56,
                    width: double.infinity,
                    child: Text('We Provide Door To Door Delivery Service',style: GoogleFonts.urbanist(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),),
                  )
                  ,
                  Text('All Over Bangladesh',style: GoogleFonts.urbanist(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87
                  ),),
                  SizedBox(height: 50,),
                  Container(
                    height: 10,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          height: 10,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: appbarColor
                          ),
                        ),
                        SizedBox(width: 7,),
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen2(),));
                          },
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        InkWell(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen3(),));
                            },

                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen2(),));
                    },
                    child: Container(
                      margin: EdgeInsets.only(top: 40),
                      height: 55,
                      width: 170,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: appbarColor,
                      ),
                      child: CustomText(text: "Get Started", fontSize: 18, fontWeight: FontWeight.w800,color: Colors.white,),
                    ),
                  )
                ],
              ),
            ),
          ],

        ),
      ),
    );
  }
}
