import 'dart:convert';
import 'dart:developer';
import 'dart:math';

import 'package:animated_notch_bottom_bar/animated_notch_bottom_bar/animated_notch_bottom_bar.dart';
import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_Http/custom_http.dart';
import 'package:e_currier/N_Statemanagement/e_currier_provider.dart';
import 'package:e_currier/N_View/DrawerScreen/history.dart';
import 'package:e_currier/N_View/DrawerScreen/suppord.dart';
import 'package:e_currier/N_View/HomeScreen/drawer.dart';
import 'package:e_currier/N_View/HomeScreen/main_home.dart';
import 'package:e_currier/N_View/Profile/profile.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';

import '../Auth/Login/screens/login_screen.dart';
import '../DrawerScreen/payment_request_list.dart';
import '../Profile/receiverProfile.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  /// Controller to handle PageView and also handles initial page
  final _pageController = PageController(initialPage:0);

  /// Controller to handle bottom nav bar and also handles initial page
  var _controller = NotchBottomBarController(index: 1);

  int maxCount = 5;
  bool is_get_profie=false;
  dynamic getDynamicSliderData;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
@override
  void initState() {
   Provider.of<E_Currier_Provierd>(context,listen: false).getProfileProvider(context);
    Provider.of<E_Currier_Provierd>(context,listen: false).getTotalOrderProvider(context);

    // TODO: implement initState
    super.initState();
  }
  /// widget list
  final List<Widget> bottomBarPages = [


    MainHomeScreen(),
    ReceiverProfile(),
   // ProfileScreen(),




  ];
final _scaffoldkey=GlobalKey<ScaffoldState>();
List drawerlist=[
  Container(
    height: 39,
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Image(image: AssetImage("assets/Drawerimage/dashboard 1.png"),height: 25,width: 25,),
        SizedBox(width: 15,),
        CustomText(text: "Dashboard", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
      ],
    ),
  ),
  Container(
    height: 39,
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Image(image: AssetImage("assets/Drawerimage/history 1.png"),height: 25,width: 25,),
        SizedBox(width: 15,),
        CustomText(text: "Order History", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
      ],
    ),
  ),
  // Container(
  //   height: 39,
  //   padding: const EdgeInsets.all(8.0),
  //   child: Row(
  //     crossAxisAlignment: CrossAxisAlignment.center,
  //
  //     children: [
  //       Image(image: AssetImage("assets/Drawerimage/cash-payment 1.png"),height: 25,width: 25,),
  //       SizedBox(width: 15,),
  //       CustomText(text: "Payment Request List", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
  //     ],
  //   ),
  // ),
  Container(
    height: 39,
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Image(image: AssetImage("assets/Drawerimage/transaction-history 1.png"),height: 25,width: 25,),
        SizedBox(width: 15,),
        CustomText(text: "Payment History", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
      ],
    ),
  ),
  Container(
    height: 39,
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Image(image: AssetImage("assets/Drawerimage/support 1.png"),height: 25,width: 25,),
        SizedBox(width: 15,),
        CustomText(text: "Support/Complain", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
      ],
    ),
  ),
  Container(
    height: 39,
    padding: const EdgeInsets.all(8.0),
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,

      children: [
        Image(image: AssetImage("assets/Drawerimage/logout 1.png"),height: 25,width: 25,),
        SizedBox(width: 15,),
        CustomText(text: "Log Out", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
      ],
    ),
  ),
];
int Select_index=0;
  @override
  Widget build(BuildContext context) {

     print("AAAAAAAAAAAATTTTTTTTTT ${GetStorage().read("Api_token")}");
     print("AAAAAAAAAAAATTTTTTTTTT ${GetStorage().read("Api_token")}");

    return WillPopScope(
      onWillPop: () { return Future(() => false); },
      child: Scaffold(
        key: _scaffoldkey,
        drawer: DrawerScreen(),

        body: PageView(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: List.generate(
              bottomBarPages.length, (index) => bottomBarPages[index]),
        ),
        extendBody: true,
        bottomNavigationBar: (bottomBarPages.length <= maxCount)
            ? AnimatedNotchBottomBar(
          /// Provide NotchBottomBarController
          notchBottomBarController: _controller,
       //   color: redColor,
          color: Color(0xFFCBCBCB),
          showLabel: false,
          shadowElevation:9,
          kBottomRadius: 28.0,
          notchColor: redColor,
          /// restart app if you change removeMargins
          removeMargins: false,
          bottomBarWidth: 500,
          showShadow: false,
          durationInMilliSeconds: 300,
          elevation: 1,
          bottomBarItems: const [
            BottomBarItem(
              inActiveItem: Image(image: AssetImage("assets/menu 2.png"),height: 25,width: 25,color: Colors.black,),
              activeItem: Image(image: AssetImage("assets/menu 2.png"),height: 25,width: 25,color: Color(0xFFF8FFF6)),
              itemLabel: 'Page 1',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.home,
                color: Colors.black,
                size: 25,
              ),
              activeItem: Icon(
                Icons.home,
                color: Cwhite,
                size: 25,
              ),
              itemLabel: 'Page 1',
            ),
            BottomBarItem(
              inActiveItem: Icon(
                Icons.person,
                color: Colors.black,
                size: 25,
              ),
              activeItem: Icon(
                Icons.person,
                color: Cwhite,
                size: 25,
              ),
              itemLabel: 'Page 5',
            ),

          ],
          onTap: (index) {
            if(index==0 || index==1){
              _pageController.jumpToPage(0);

              if(index==0){
                _scaffoldkey.currentState!.openDrawer();

              }
            }else{
              _pageController.jumpToPage(1);
            }
          },
          kIconSize: 24.0,
        )
            : null,
      ),
    );
  }
}
