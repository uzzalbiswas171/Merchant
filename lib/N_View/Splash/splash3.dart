import 'package:e_currier/CustomButton/custom_button.dart';
import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_View/Auth/Login/screens/login_screen.dart';
import 'package:e_currier/N_View/Splash/splash1.dart';
import 'package:e_currier/N_View/Splash/splash2.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreen3 extends StatefulWidget {
  const SplashScreen3({super.key});

  @override
  State<SplashScreen3> createState() => _SplashScreen3State();
}

class _SplashScreen3State extends State<SplashScreen3> {
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
              margin:  EdgeInsets.only(top: 210,left: 10,right: 10),
              child: Image(image: AssetImage("assets/secure delivery 1.png"),height: 200,width: 300,fit: BoxFit.fill,),
            ),),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 40),
                    height: 66,
                    width: double.infinity,
                    alignment: Alignment.topCenter,
                    child: Text('We have most experienced team through',style: GoogleFonts.urbanist(
                      fontSize: 22,
                      fontWeight: FontWeight.w800,
                    ),),
                  )
                  ,
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 30),
                    child: Text('Which your parcel will be delivered quickly & securely',style: GoogleFonts.urbanist(
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                        color: Colors.black87
                    ),),
                  ),
                  SizedBox(height: 10,),
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
                        ), InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SplashScreen2(),));

                          },
                          child: CircleAvatar(
                            radius: 10,
                            backgroundColor: Colors.grey,
                          ),
                        ),
                        Container(
                          height: 10,
                          width: 20,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: appbarColor
                          ),
                        ),
                        SizedBox(width: 7,),


                      ],
                    ),
                  ),
                  SizedBox(height: 40),
                  InkWell(
                    onTap: () {
                      Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                    },
                    child: Container(
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
