import 'package:e_currier/N_View/Auth/Login/screens/login_screen.dart';
import 'package:e_currier/N_View/Splash/splash1.dart';
import 'package:e_currier/N_View/Splash/splashpageview.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../N_Statemanagement/e_currier_provider.dart';
import '../HomeScreen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    Provider.of<E_Currier_Provierd>(context,listen: false).getProfileProvider(context);
      Future.delayed(Duration(seconds: 2),(){
        if(GetStorage().read("Api_token") != null ){
          Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
        }
        else {
          Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));

        }
      });



    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 150),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
        //   Container(
        //   height: 166,
        //   width: 250,
        //   decoration: BoxDecoration(
        //       image: DecorationImage(image: AssetImage("assets/splashicon.png"),fit: BoxFit.fill)
        //   )
        // ),
          Container(
          height: 166,
          width: 250,
          decoration: BoxDecoration(
              image: DecorationImage(image: AssetImage("assets/Drawerimage/e_courier.png"),fit: BoxFit.fill)
          )
        ),
            SizedBox(height: MediaQuery.of(context).size.height/9,),
            Image.asset("assets/zSo.gif",height: 60,width: 60,)
         ]
        ),
      )


    );
  }
}
