import 'dart:convert';

import 'package:e_currier/CustomButton/custom_button.dart';
import 'package:e_currier/N_View/Profile/receiverProfile.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:share_plus/share_plus.dart';

import '../../N_CustomWidget/CustomText/custom_text.dart';
import '../../N_Http/custom_http.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool is_get_profie=false;
  getProfile(BuildContext context)async{
    String url="${BaseUrl}/api/auth/merchant_profile";
    try{
      Response response=await http.get(Uri.parse(url),headers: CustomHttp().headers);
      print(response.body);
      var decodedata=jsonDecode(response.body);
      GetStorage().write("GetProfile", decodedata);
      if(response.statusCode==200){
         setState(() {
           is_get_profie=true;
         });
      }
    }catch(e){
      print("Peg profile catch error $e");
    }
    //  return getDynamicSliderData;
  }

  @override
  void initState() {
    getProfile(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    print(GetStorage().read("GetProfile"));
    return Scaffold(
      backgroundColor: customredcolor.withOpacity(0.3),
      body:GetStorage().read("GetProfile")!=null? Container(
        padding: EdgeInsets.all(15),
        height: double.infinity,
        width: double.infinity,
          decoration: BoxDecoration(
              image: DecorationImage(image:  NetworkImage("${GetStorage().read("GetProfile")["image"]}"),fit: BoxFit.fill)
          ),
        child:is_get_profie? SingleChildScrollView(
          child: Column(
            children: [
              Container( 
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.only(bottom: 10,left: 10,right: 10),
                margin: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(
                      child: Container(
                        width: 100,
                        margin: EdgeInsets.only(
                            top: 20,bottom: 10
                        ),
                        child: Stack(
                          children: [
                            Center(
                              child: CircleAvatar(
                                radius: 50,
                                backgroundColor: appbarColor,
                                child: CircleAvatar(
                                  radius: 42,
                                  backgroundImage:NetworkImage("${BaseUrl}${GetStorage().read("GetProfile")["image"]}"),
                                ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    ),
                    CustomText(text:  "NAME : ${GetStorage().read("GetProfile")["admin"]["name"]}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                     Divider(),
                     CustomText(text:  "PHONE : ${GetStorage().read("GetProfile")["phone"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "EMAIL : ${GetStorage().read("GetProfile")["admin"]["email"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "ADDRESS : ${GetStorage().read("GetProfile")["picup_address"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    InkWell(
                        onTap: () {
                          Share.share(GetStorage().read("GetProfile")["fb_link"]);
                        },
                        child: CustomText(text:  "FB : ${GetStorage().read("GetProfile")["fb_link"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8))),
                    Divider(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.only(bottom: 10,left: 10,right: 10,top: 10),
                margin: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text:  "SHOP NAME : ${GetStorage().read("GetProfile")["shop_name"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "MERCHANT NAME : ${GetStorage().read("GetProfile")["admin"]["name"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "SHOP EMAIL : ${GetStorage().read("GetProfile")["admin"]["email"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                     Divider(),
                    CustomText(text: "${GetStorage().read("GetProfile")["plan_name"]}"=="null"?"PLANE : ": "PLANE : ${GetStorage().read("GetProfile")["plan_name"]["name"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text: GetStorage().read("GetProfile")["area_name"] == null? "PICKUP AREA : ": "PICKUP AREA : ${GetStorage().read("GetProfile")["area_name"]["name"]}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "COD CHARGE : ${GetStorage().read("GetProfile")["cod_charge"]??"0"}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "ROUTING NO : ${GetStorage().read("GetProfile")["routing_no"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "PICKUP ADDRESS : ${GetStorage().read("GetProfile")["picup_address"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                  ],
                ),
              ),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.8),
                  borderRadius: BorderRadius.circular(15),
                ),
                padding: EdgeInsets.only(bottom: 10,left: 10,right: 10,top: 10),
                margin: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    CustomText(text:  "BANK-NAME : ${GetStorage().read("GetProfile")["bank_name"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "BANK-AC-NO :  ${GetStorage().read("GetProfile")["bank_ac_number"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "BANK-AC-NAME : ${GetStorage().read("GetProfile")["bankaccount_name"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "ACCOUNT TYPE: ${GetStorage().read("GetProfile")["account_type"]??""}", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:GetStorage().read("GetProfile")["trans_method"]=="null"?"TRANSACTION METHOD"  :"TRANSACTION METHOD : ${GetStorage().read("GetProfile")["trans_method"]} ", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                    CustomText(text:  "BRANCH : ${GetStorage().read("GetProfile")["branch"]??""} ", fontSize: 16, fontWeight: FontWeight.bold,color: Colors.black.withOpacity(0.8)),
                    Divider(),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                height: 200,
                width: double.infinity,
                decoration:BoxDecoration(
                  color: appbarColor,
                  borderRadius:BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "NID FONT", fontSize: 20, fontWeight: FontWeight.bold),
                    Expanded(child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                         image: DecorationImage( image: NetworkImage("$BaseUrl/${GetStorage().read("GetProfile")["nid"]}"),fit: BoxFit.fill)
                        //  image: DecorationImage( image: NetworkImage("${BaseUrl}${GetStorage().read("GetProfile")["image"]}"),fit: BoxFit.fill)
                      ),
                    ))
                  ],
                ),
              ),
            Container(
              margin: EdgeInsets.all(15),
              padding: EdgeInsets.all(15),
              height: 200,
              width: double.infinity,
              decoration:BoxDecoration(
                color: appbarColor,
                borderRadius:BorderRadius.circular(11),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(text: "NID BACK", fontSize: 20, fontWeight: FontWeight.bold),
                  Expanded(child: Container(
                    height: 100,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(11),
                      image: DecorationImage( image: NetworkImage("$BaseUrl/${GetStorage().read("GetProfile")["nid_back"]}"),fit: BoxFit.fill)
                      //   image: DecorationImage( image: AssetImage("assets/banner.jpg"),fit: BoxFit.fill)
                    ),
                  ))
                ],
              ),
            ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                height: 200,
                width: double.infinity,
                decoration:BoxDecoration(
                  color: appbarColor,
                  borderRadius:BorderRadius.circular(11),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(text: "TRADE LICENCE", fontSize: 20, fontWeight: FontWeight.bold),
                    Expanded(child: Container(
                      height: 100,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(11),
                      image: DecorationImage( image: NetworkImage("$BaseUrl/${GetStorage().read("GetProfile")["trade_licence"]}"),fit: BoxFit.fill)
                        //      image: DecorationImage( image: AssetImage("assets/banner.jpg"),fit: BoxFit.fill)
                      ),
                    ))
                  ],
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10),
                child: CustomButton(onTap: () {

                  Navigator.push(context, MaterialPageRoute(builder: (context) => ReceiverProfile(),));
                }, text: "Update Profile", button_text_fontSize: 16, button_height: 55),
              ),
              SizedBox(height: 100,)
          ]
        )
      ):Center(
          child: CircularProgressIndicator(),
        )
    ) :Center(
        child: CircularProgressIndicator(),
      )
    );
  }
}
