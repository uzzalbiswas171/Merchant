import 'package:e_currier/N_View/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:provider/provider.dart';

import '../../N_CustomWidget/CustomText/custom_text.dart';
import '../../N_Statemanagement/e_currier_provider.dart';
import '../../constant.dart';
import '../Auth/Login/screens/login_screen.dart';
import '../DrawerScreen/history.dart';
import '../DrawerScreen/payment_request_list.dart';
import '../DrawerScreen/suppord.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
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
  void initState() {

    Provider.of<E_Currier_Provierd>(context,listen: false).getTotalOrderProvider(context);

    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor:  Colors.white,
      child: Container(
        height: double.infinity,
        width: 300,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              "${GetStorage().read("GetProfile")}"=="null"?CircularProgressIndicator() :   Center(
                child: Container(
                  height: 75,
                  width: 75,
                  alignment: Alignment.center,
                  margin: EdgeInsets.only(left: 20,right: 20,top: 25,bottom: 5),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(11),
                      image: DecorationImage(
                          image: NetworkImage("$BaseUrl${GetStorage().read("GetProfile")['image']}"),
                          fit: BoxFit.fill)),
                ),
              ),
              "${GetStorage().read("GetProfile")}"=="null"?Container() :  Center(child: CustomText(text: "${GetStorage().read("GetProfile")['admin']["name"]}", fontSize: 19, fontWeight: FontWeight.w700,letterSpacing: 0.2,)),
              "${GetStorage().read("GetProfile")}"=="null"?Container() : Center(child: CustomText(text: "ID : OC-2024${GetStorage().read("GetProfile")['admin']["id"]}", fontSize: 15, fontWeight: FontWeight.w400,letterSpacing: 0.2,)),

              Container(
                height: 330,
                child: ListView.builder(
                  itemCount: drawerlist.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: EdgeInsets.only(left: 5,right: 5,bottom: 10),
                      color:Select_index==index?Color(0xe8ee7271):Color(
                          0xfffaf7f9),
                      child: InkWell(
                        onTap: () {
                          setState(() {
                            print("ssssssssssssssss >:${index}");
                            Select_index=index;
                          });
                          if(index==0){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
                          }
                          else if(index==1){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => DrawerHistoryScreen(),));
                          }
                          else if(index==2){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => PaymentRequestListScreen(
                              selected_index: 0,
                            ),));
                          }

                          else if(index==3){
                            Navigator.push(context, MaterialPageRoute(builder: (context) => SupportScreen(),));
                          }
                          else if(index==4){
                            ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Log Out Successfull")));
                            GetStorage().erase();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginScreen(),
                                ),
                            );
                          }
                        },
                        child: drawerlist[index],
                      ),
                    );
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
