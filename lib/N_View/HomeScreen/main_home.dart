
import 'package:e_currier/CustomButton/custom_button.dart';
import 'package:e_currier/N_View/Addparcell/add_percell.dart';
import 'package:e_currier/N_View/HomeScreen/Notification/notification.dart';
import 'package:e_currier/N_View/HomeScreen/balanch_details.dart';
import 'package:e_currier/N_View/HomeScreen/trackparcel.dart'; import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../N_CustomWidget/CustomText/custom_text.dart';
import '../../N_Statemanagement/e_currier_provider.dart';
import '../../constant.dart';

class MainHomeScreen extends StatefulWidget {
  const MainHomeScreen({super.key});

  @override
  State<MainHomeScreen> createState() => _MainHomeScreenState();
}

class _MainHomeScreenState extends State<MainHomeScreen> {
  TextEditingController Trackcontroller=TextEditingController();
  @override
  void initState() {
    Provider.of<E_Currier_Provierd>(context,listen: false).balenceHistoryProvider(context);
    // Provider.of<E_Currier_Provierd>(context,listen: false).getgetdatewiseListProvider(context, "$selectedDatee", "$selected2Datee");
    Provider.of<E_Currier_Provierd>(context,listen: false).getTotalOrderProvider(context);
    Provider.of<E_Currier_Provierd>(context,listen: false).getgetdatewiseListProvider(context, "${DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()}", "${DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()}");
    // TODO: implement initState
    super.initState();
  }
  final _key=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    final balenceHistory=  Provider.of<E_Currier_Provierd>(context).balenceHistory;
    List TotalOrdetlist=Provider.of<E_Currier_Provierd>(context).getTotalOrderList;
    final getdatewiseList=Provider.of<E_Currier_Provierd>(context).getdatewiseList;
    print("asaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa $getdatewiseList");
    return RefreshIndicator(
      onRefresh: () {
        return Future.delayed(Duration(seconds: 1),() {
          Provider.of<E_Currier_Provierd>(context,listen: false).getProfileProvider(context);
          Provider.of<E_Currier_Provierd>(context,listen: false).getgetdatewiseListProvider(context, "$selectedDatee", "$selected2Datee");
          Provider.of<E_Currier_Provierd>(context,listen: false).getTotalOrderProvider(context);
          Provider.of<E_Currier_Provierd>(context,listen: false).balenceHistoryProvider(context);
       //   Provider.of<E_Currier_Provierd>(context,listen: false).getgetdatewiseListProvider(context, "${DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()}", "${DateFormat('yyyy-MM-dd').format(DateTime.now()).toString()}");
          setState(() {

          });
        },);
      },
      child: Scaffold(
        body: Container(
          height: double.infinity,
          width: double.infinity,
          color: figma_white,

          padding: EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 30,
                  width: double.infinity,
                ),
                SizedBox(height: 20,),
                "${GetStorage().read("GetProfile")}"=="null"?CircularProgressIndicator() : Container(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage("$BaseUrl${GetStorage().read("GetProfile")['image']}"),
                      ),
                      SizedBox(width: 15,),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(text: "${GetStorage().read("GetProfile")['admin']["name"]}", fontSize: 15, fontWeight: FontWeight.w400),
                          CustomText(text: "${GetStorage().read("GetProfile")['balance']}TK BDT", fontSize: 13, fontWeight: FontWeight.w400),

                        ],
                       ),
                      Spacer(),
                      Stack(
                        children: [
                          Card(
                            color: figma_white,
                            elevation: 5,
                            child: IconButton(onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationScreen(),));
                            }, icon: Icon(Icons.notifications_rounded,size: 28,))
                          ),
                          Positioned(
                            right: 15,
                              top: 10,
                              child: CircleAvatar(
                                radius: 6,
                                backgroundColor: appbarColor,
                          ))
                        ],
                      )
                    ],
                  ),
                ),
                SizedBox(height: 30,),
                CustomButton(onTap: () {
                  Provider.of<E_Currier_Provierd>(context,listen: false).balenceHistoryProvider(context);
                  Navigator.push(context, MaterialPageRoute(builder: (context) => BalanchScreen(),));
                }, text: 'AVAILABLE BALANCE', button_text_fontSize: 16, button_height: 55)
                ,SizedBox(height: 20,),
                Stack(
                  children: [
                    Container(
                      height: 175,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(image: AssetImage('assets/banner2.png'),fit: BoxFit.fill)
                      ),
                    ),
                    Positioned(
                        bottom: 15,left: 15,
                        child: InkWell(
                          onTap: () {
                            Navigator.push(context, MaterialPageRoute(builder: (context) => AddPercellScreen(),));
                          },
                          child: Container(
                                              height: 40,
                                              width: 150,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white
                                              ),
                            child: CustomText(text: "Create Parcel", fontSize: 16, fontWeight: FontWeight.w800,color: appbarColor,),

                                            ),
                        ))
                  ],
                ),
              SizedBox(height: 15),
                Container(
                  height: 70,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                     CustomText(text: "Parcel Count", fontSize: 17, fontWeight: FontWeight.w500),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(color: Colors.black,width: 1,style: BorderStyle.solid)
                        ),
                        child: Row(
                          children: [
                            InkWell(
                              onTap:(){
                                _selectDate(context);
                      },
                              child: Container(
                                padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,color: Colors.black,style: BorderStyle.solid
                                    )
                                  ),
                                  child: Image(image: AssetImage("assets/calendar 1.png"),height: 20,width:20,fit:BoxFit.fill)),
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: CustomText(text: "${selectedDatee}", fontSize: 13, fontWeight: FontWeight.w400,color: Colors.black45,))
                         ,

                            InkWell(
                              onTap:(){
                                _select2Date(context);
                      },
                              child: Container(
                                padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                      width: 1,color: Colors.black,style: BorderStyle.solid
                                    )
                                  ),
                                  child: Image(image: AssetImage("assets/calendar 1.png"),height: 20,width:20,fit:BoxFit.fill)),
                            ),
                            SizedBox(width: 10,),
                            Expanded(child: CustomText(text: "${selected2Datee}", fontSize: 13, fontWeight: FontWeight.w400,color: Colors.black45,))
                            ,Container(
                             height: 35,
                             width: 80,
                              child: CustomButton(onTap: () {
                              Provider.of<E_Currier_Provierd>(context,listen: false).getgetdatewiseListProvider(context, "$selectedDatee", "$selected2Datee");
                              showDialog(
                                barrierDismissible: false,
                                context: context, builder: (context) {
                                Future.delayed(Duration(seconds: 2),() {
                                  Navigator.pop(context);
                                },);
                                return AlertDialog(
                                  title: Text("Please Wait"),actions: [
                                  Center(child: CircularProgressIndicator()),
                                   ],
                                  );
                                 },
                               );
                              }, text: "SEARCH", button_text_fontSize: 15, button_height: 35),
                            )

                          ],
                        ),
                      ),

                    ],
                  ),
                ),
                SizedBox(height: 10,),
                Container(
                  height: 65,
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(

                    children: [
                      Expanded(
                          child:  Container(
                           decoration: BoxDecoration(
                             borderRadius: BorderRadius.all(Radius.circular(10)),
                             border: Border.all(width:1.2,color:  Color(0xff72f69c))
                           ),
                           padding: EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(text:"${getdatewiseList}"=="null"?"0": "${getdatewiseList["active"]} ", fontSize: 13, fontWeight: FontWeight.w400),
                                    CustomText(text: " ", fontSize: 11, fontWeight: FontWeight.w400,color: Colors.greenAccent.shade200),
                                  ],
                                ),
                                CustomText(text: "Active Parcel", fontSize: 13, fontWeight: FontWeight.w400)
                              ],
                            ),
                          )
                      ),
                      SizedBox(width: 18,),
                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(width:1.2,color:  customredcolor)
                            ),
                            padding: EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        CustomText(text:"${getdatewiseList}"=="null"?"0":  "${getdatewiseList["pending"]}", fontSize: 13, fontWeight: FontWeight.w400),
                                        CustomText(text: "", fontSize: 11, fontWeight: FontWeight.w400,color: appbarColor),
                                      ],
                                    ),
                                    CustomText(text: " ", fontSize: 13, fontWeight: FontWeight.w400,color: appbarColor),
                                  ],
                                ),
                                CustomText(text: "Pending Parcel", fontSize: 13, fontWeight: FontWeight.w400)
                              ],
                            ),
                          )
                      ),
                      SizedBox(width: 18,),

                      Expanded(
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(10)),
                                border: Border.all(width:1.2,color:  customredcolor)
                            ),
                            padding: EdgeInsets.only(left: 5),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    CustomText(text:"${getdatewiseList}"=="null"?"0":  "${getdatewiseList["return"]} ", fontSize: 13, fontWeight: FontWeight.w400),
                                    CustomText(text: " ", fontSize: 11, fontWeight: FontWeight.w400,color: appbarColor),
                                  ],
                                ),
                                CustomText(text: "Return Parcel", fontSize: 13, fontWeight: FontWeight.w400)
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 15,),
                 Container(
                   height: 65,
                   width: double.infinity,
                   decoration: BoxDecoration(
                     color: customredcolor,
                     borderRadius: BorderRadius.circular(11),
                   ),
                   padding: EdgeInsets.all(10),
                   child: Row(
                     children: [
                       Image(image: AssetImage("assets/orderprocessing.png"),fit: BoxFit.fill,height: 25,width: 25,),
                       SizedBox(width: 10,),
                       CustomText(text: "Process Parcel Amount", fontSize: 18, fontWeight: FontWeight.w600,color:Color(0xffFFFFFF)),
                       CustomText(text:"${balenceHistory}"=="null"?"0": " ৳ ${balenceHistory["payable_deliveryCharge"]}", fontSize: 17, fontWeight: FontWeight.w600,color:Color(0xffFFFFFF) ),
                     ],
                   ),
                 ),
                SizedBox(height: 15,),
                Container(
                  height: 112,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: customredcolor,
                    borderRadius: BorderRadius.circular(11),
                  ),
                  margin: EdgeInsets.all(10),
                  padding: EdgeInsets.only(left: 20,right: 20,top:10,bottom: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(text: "TRACK YOUR PARCEL", fontSize: 20, fontWeight: FontWeight.w700,color: Colors.white,),
                      Container(
                        margin: EdgeInsets.only(top: 5),
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          color: Colors.white,
                        ),
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Form(
                                key: _key,
                                child: TextFormField(
                                   validator: (value) => value!.isEmpty ? 'Field cannot be blank':null,
                                  controller: Trackcontroller,
                                  decoration: InputDecoration(
                                    contentPadding: EdgeInsets.only(top: 10,bottom: 10),
                                    errorStyle: TextStyle(
                                      fontSize: 0.1
                                    ),
                                    border: InputBorder.none,
                                    hintText: "Enter parcel id",
                                    hintStyle: GoogleFonts.roboto(
                                      fontSize:18,
                                      fontWeight: FontWeight.w500
                                    ),
                                    prefixIcon: IconButton(onPressed: () {

                                    }, icon: Icon(Icons.my_location,color: appbarColor,)),
                                    suffixIcon:  InkWell(
                                        onTap: () {
                                          if(_key.currentState!.validate()){
                                            Navigator.push(context, MaterialPageRoute(builder: (context) => TrackParcelScreen(parcel_id: Trackcontroller.text.toString()),));
                                          }
                                      },
                                        child: Card(child: Icon(Icons.search,color: Colors.black,size: 30,))) ),
                                  ),
                              ),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 100,),

              ],
            ),
          ),
        )
      ),
    );
  }
  String selectedDatee = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDatee) {
      final df = new DateFormat('yyyy-MM-dd');
      setState(() {
        selectedDatee =df.format(picked);
      });
    }
  }

  String selected2Datee = DateFormat('yyyy-MM-dd').format(DateTime.now()).toString();
  Future<void> _select2Date(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selected2Datee) {
      final df = new DateFormat('yyyy-MM-dd');
      setState(() {
        selected2Datee =df.format(picked);
      });
    }
  }


  var list;
  final df = new DateFormat('dd-MM-yyyy');


}
