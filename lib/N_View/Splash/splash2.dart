import 'package:e_currier/CustomButton/custom_button.dart';
import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_View/Splash/splash1.dart';
import 'package:e_currier/N_View/Splash/splash3.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen2 extends StatefulWidget {
  const SplashScreen2({super.key});

  @override
  State<SplashScreen2> createState() => _SplashScreen2State();
}

class _SplashScreen2State extends State<SplashScreen2> {
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
              margin:  EdgeInsets.only(top: 130),
              child: Image(image: AssetImage("assets/payment reqpuest 1.png"),height: 274,width: 206,fit: BoxFit.fill,),
            ),),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 40,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Text('We Have APS Payment Method',style: GoogleFonts.urbanist(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),),
                  )
                  ,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Ocado Courier offers the most convenient instant payment method',style: GoogleFonts.urbanist(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                    ),),
                  ),
                  SizedBox(height: 40,),
                  Container(
                    height: 10,
                    width: double.infinity,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen1(),));
                          },
                          child: CircleAvatar(
                          radius: 10,
                          backgroundColor: Colors.grey,
                                                ),
                        ),
                        SizedBox(width: 7,),
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
                      Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen3(),));
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
