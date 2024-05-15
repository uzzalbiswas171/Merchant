import 'package:e_currier/N_View/Splash/splash1.dart';
import 'package:e_currier/N_View/Splash/splash2.dart';
import 'package:e_currier/N_View/Splash/splash3.dart';
import 'package:flutter/material.dart';

class SplashPageviewScreen extends StatefulWidget {
  const SplashPageviewScreen({super.key});
   // int initialPage;
  @override
  State<SplashPageviewScreen> createState() => _SplashPageviewScreenState();
}

class _SplashPageviewScreenState extends State<SplashPageviewScreen> {
  // PageController? controller=PageController(initialPage: initialPage),
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child: PageView(
          // controller: PageController(initialPage: 2),
          children: [
            SplashScreen1(),
            SplashScreen2(),
            SplashScreen3()
          ],
        ),
      ),
    );
  }
}
