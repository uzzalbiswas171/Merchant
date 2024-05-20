
import 'dart:convert';
import 'dart:ui';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:e_currier/CustomButton/custom_button.dart';
import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_CustomWidget/custom_text_formfield.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'dart:ui';

import 'package:provider/provider.dart';

import '../../N_Statemanagement/e_currier_provider.dart';
import '../../constant.dart';
import '../HomeScreen/home_screen.dart';
import 'package:image_picker/image_picker.dart';

class ReceiverProfile extends StatefulWidget {
  const ReceiverProfile({super.key});

  @override
  State<ReceiverProfile> createState() => _ReceiverProfileState();
}

class _ReceiverProfileState extends State<ReceiverProfile> {
  TextEditingController _b_name_controller=TextEditingController();
  TextEditingController _email_controller=TextEditingController();
  TextEditingController _primary_phone_controller=TextEditingController();
  TextEditingController _contact_number_controller=TextEditingController();
  TextEditingController _fbpage_controller=TextEditingController();
  TextEditingController _pickup_controller=TextEditingController();
  TextEditingController _payment_info_controller=TextEditingController();
  TextEditingController _password_controller=TextEditingController();
  TextEditingController _change_password_controller=TextEditingController();
  final _formkey=GlobalKey<FormState>();
  File ? _image;

  final picker = ImagePicker();
  ///NID font
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }
  @override
  void initState() {
    Provider.of<E_Currier_Provierd>(context,listen: false).getProfileProvider(context);
    _b_name_controller.text="${GetStorage().read("GetProfile")["shop_name"]}";
    _primary_phone_controller.text="${GetStorage().read("GetProfile")["phone"]}";
    _contact_number_controller.text="${GetStorage().read("GetProfile")["phone"]}";
    _email_controller.text="${GetStorage().read("GetProfile")["admin"]["email"]}";
    _fbpage_controller.text="${GetStorage().read("GetProfile")["fb_link"]??""}";
    _pickup_controller.text="${GetStorage().read("GetProfile")["picup_address"]??""}";
    _payment_info_controller.text="${GetStorage().read("GetProfile")["bank_name"]??""}";
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
print("sssssssssssssssssssssssss ${GetStorage().read("GetProfile")}");
print("sssssssssssssssssssssssss ${GetStorage().read("GetProfile").runtimeType}");
     return RefreshIndicator(
       onRefresh: () {
         return Future((){
           Provider.of<E_Currier_Provierd>(context,listen: false).getProfileProvider(context);
         });
       },
       child: Scaffold(
         body: Container(
           color: redColor,
          height: double.infinity,
          width: double.infinity,
           child: SingleChildScrollView(
             child: Column(
               children: [
                 Container(
                   height: 300,
                   width: double.infinity,
                   color: redColor,
                   child: Column(
                     children: [
                       Container(
                         padding: EdgeInsets.only(top: 40,left: 15),
                       alignment: Alignment.centerLeft,
                       child: CustomText(text: "Profile", fontSize: 28, fontWeight: FontWeight.w600,letterSpacing: 2,color: Colors.white,),
                       )   ,
                       InkWell(
                         onTap: () {
                           getImageFromGallery();
                         },
                         child: Container(
                           height: 100,
                           width: 100,
                           child: _image==null? CircleAvatar(
                             radius: 60,
                             backgroundColor: Colors.grey,
                             child: CircleAvatar(
                               radius: 56,
                               backgroundImage: NetworkImage("$BaseUrl${GetStorage().read("GetProfile")["image"]}"),
                             ),
                           ):
                           ClipRRect(
                               borderRadius: BorderRadius.circular(10),
                               child: Image.file(_image!.renameSync(_image!.path),
                                 fit: BoxFit.fill,)),
                         ),
                       ),

                       CustomText(text: "${GetStorage().read("GetProfile")["admin"]["name"]}", fontSize: 35, fontWeight: FontWeight.w600,letterSpacing: 2,color: Colors.white,),
                       CustomText(text: "ID: ${GetStorage().read("GetProfile")["admin"]["id"]}", fontSize: 20, fontWeight: FontWeight.w400,letterSpacing: 2,color: Colors.white,)
                     ],
                   ),
                 ),
                 Container(
                                height: MediaQuery.of(context).size.height*0.95,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                 borderRadius: BorderRadius.only(
                   topLeft: Radius.circular(44),
                   topRight: Radius.circular(44)
                 ),
                 color: Colors.white
                                ),
                   padding: EdgeInsets.only(
                     left: 20,right: 20,top: 15
                   ),
                   child: Form(
                     key: _formkey,
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                      height: 38,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "Business Name", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                          Expanded(
                            flex: 3,
                            child: CustomTextFormFieldd(
                              readOnly: true,
                              maxline: 1, height: 38, hintext: "Enter name", controller:_b_name_controller , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                            },),
                          )
                        ],
                      ),
                                     ),
                         Container(
                           margin: EdgeInsets.only(top: 10),
                      height: 38,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "Email", fontSize: 15, fontWeight: FontWeight.w700, color: customredcolor,)),
                          Expanded(
                            flex: 3,
                            child: CustomTextFormFieldd(
                              readOnly: true,
                              maxline: 1, height: 38, hintext: "Enter Email", controller: _email_controller, obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                            },),
                          )
                        ],
                      ),
                                     ),
                         Container(
                           margin: EdgeInsets.only(top: 10),
                      height: 38,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "Primary phone", fontSize: 15, fontWeight: FontWeight.w700, color: customredcolor,)),
                          Expanded(
                            flex: 3,
                            child: CustomTextFormFieldd(
                              readOnly: true,
                              maxline: 1, height: 38, hintext: "", controller: _primary_phone_controller, obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                            },),
                          )
                        ],
                      ),
                                     ),
                         Container(
                           margin: EdgeInsets.only(top: 10),
                      height: 38,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "Contact Number", fontSize: 15, fontWeight: FontWeight.w700, color: customredcolor,)),
                          Expanded(
                            flex: 3,
                            child: CustomTextFormFieldd(
                              readOnly: true,
                              maxline: 1, height: 38, hintext: "", controller: _contact_number_controller, obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                            },),
                          )
                        ],
                      ),
                                     ),
                         Container(
                           margin: EdgeInsets.only(top: 10),
                      height: 38,
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "FB Page/Website", fontSize: 15, fontWeight: FontWeight.w700, color: customredcolor,)),
                          Expanded(
                            flex: 3,
                            child: CustomTextFormFieldd(
                              readOnly: true,
                              maxline: 1, height: 38, hintext: "", controller: _fbpage_controller, obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                            },),
                          )
                        ],
                      ),
                                     ),
                         Container(
                           margin: EdgeInsets.only(top: 10),
                      height: 86,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Row(crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Pick Up Address", fontSize: 15, fontWeight: FontWeight.w700, color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 4, height: 86, hintext: "", controller: _pickup_controller, obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                          Positioned(
                              right: 10,
                              top: 10,
                              child: Image(image: AssetImage("assets/edit-document 1.png"),fit: BoxFit.fill,height: 20,width: 20,),

                          )
                        ],
                      ),
                                     ),
                         Container(
                           margin: EdgeInsets.only(top: 10),
                      height: 38,
                      width: double.infinity,
                      child: Stack(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Payment Information", fontSize: 15, fontWeight: FontWeight.w700, color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller: _payment_info_controller, obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {
                                },),
                              )
                            ],
                          ),
                          Positioned(
                            right: 10,
                            top: 10,
                            child: Image(image: AssetImage("assets/edit-document 1.png"),fit: BoxFit.fill,height: 20,width: 20,),

                          )
                        ],
                      ),
                                     ),
                         Container(
                           margin: EdgeInsets.only(top: 10),
                      height: 38,
                      width: double.infinity,
                      child: Row(     children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "Change Password", fontSize: 15, fontWeight: FontWeight.w700, color: customredcolor,)),
                          Expanded(
                            flex: 3,
                            child: CustomTextFormFieldd(

                              readOnly: false,
                              maxline: 1, height: 38, hintext: "", controller: _password_controller, obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                            },),
                          )
                        ],
                      ),
                                     ),
                         Container(
                           margin: EdgeInsets.only(top: 10),
                      height: 38,
                      width: double.infinity,
                      child: Row(     children: [
                          Expanded(
                              flex: 2,
                              child: CustomText(text: "Confirm Password", fontSize: 15, fontWeight: FontWeight.w700, color: customredcolor,)),
                          Expanded(
                            flex: 3,
                            child: CustomTextFormFieldd(
                              readOnly: false,
                              maxline: 1, height: 38, hintext: "", controller: _change_password_controller, obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                            },),
                          )
                        ],
                      ),
                                     ),
                         SizedBox(height: 15,),
                         is_clicked_register==true?CircularProgressIndicator(

                         ):  CustomButton(onTap: () {



                             if(_password_controller.text.length>7){
                               if(_password_controller.text==_password_controller.text){
                                 marchentProfileUpdate();
                                 setState(() {
                                   is_clicked_register=true;
                                 });
                               }else{
                                 Flushbar(
                                   flushbarPosition: FlushbarPosition.TOP,
                                   title:  "Password did not matched",
                                   message:  "Try again ...",
                                   duration:  Duration(seconds: 1),
                                 )..show(context);
                               }

                             }else{
                               Flushbar(
                                 flushbarPosition: FlushbarPosition.TOP,
                                 title:  "Password must be 8 diigit",
                                 message:  "Try again ...",
                                 duration:  Duration(seconds: 1),
                               )..show(context);
                             }

                         }, text: "Submit", button_text_fontSize: 18, button_height: 55),
                         Container(height: 140,)
                       ],
                     ),
                   ),
                 )
               ],
             ),
           ),
         ),
           ),
     );
  }
  functionval()async{
    nid_cardd ="_image"=="null"?"": await http.MultipartFile.fromPath('image', _image!.path.toString());
    request.files.add(nid_cardd);
  }
  dun(){}
  var request = http.MultipartRequest("POST",Uri.parse("${BaseUrl}/api/auth/merchant_profile_edit?id=${GetStorage().read("GetProfile")["id"]}"));

  marchentProfileUpdate() async {

    try{
      request.headers.addAll({
        "accept": "application/json",
        'Authorization': 'Bearer ${GetStorage().read("Api_token")}'
      });
      request.fields['shop_name'] = "${GetStorage().read("GetProfile")["shop_name"]}";
      request.fields['name'] = _b_name_controller.text.toString();
      request.fields['email'] = _email_controller.text.toString();
      request.fields['phone'] = _primary_phone_controller.text.toString();
      request.fields['password'] = _contact_number_controller.text.toString();
       request.fields['status'] = "1";
      request.fields['fb_link'] = _fbpage_controller.text.toString();
      request.fields['bank_name'] = _payment_info_controller.text.toString();
      request.fields['trans_method'] ="${GetStorage().read("GetProfile")["trans_method"]}";
      request.fields['picup_address'] =_pickup_controller.text.toString();
      request.fields['password'] = _password_controller.text.toString();
      "${_image}"=="null"?dun(): functionval();
      var response = await request.send();
       var responseData = await response.stream.toBytes();
       var responseString = String.fromCharCodes(responseData);
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxx ${response.statusCode}");
      if(response.statusCode==200){
        Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }else{
        setState(() {
          is_clicked_register=false;
        });
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title:  "Please change Email ",
          message:  "Please Wait ...",
          duration:  Duration(seconds: 1),
        )..show(context);
      }
      var  data = jsonDecode(responseString);
      if(data["message"]=="The given data was invalid."){
        setState(() {
          is_clicked=false;
        });
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title:  "Please change Phone",
          message:  "Please Wait ...",
          duration:  Duration(seconds: 1),
        )..show(context);
      }else{

      }
      print("====Registration Data===========>$data");
    }catch(erroe){

      setState(() {
        is_clicked_register=false;
      });
      print("Catch Error $erroe");

    }
  }
  var nid_cardd;
  bool is_clicked=false;
  bool is_clicked_register=false;
 }
