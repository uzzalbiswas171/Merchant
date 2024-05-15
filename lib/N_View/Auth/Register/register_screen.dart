import 'dart:convert';
import 'dart:ui';
import 'dart:io';
import 'package:another_flushbar/flushbar.dart';
import 'package:e_currier/N_View/Auth/Login/screens/login_screen.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:e_currier/CustomButton/custom_button.dart';
import 'package:e_currier/N_CustomWidget/custom_text_formfield.dart';
import 'package:e_currier/N_View/HomeScreen/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../N_CustomWidget/CustomText/custom_text.dart';
import '../../../N_Statemanagement/e_currier_provider.dart';
import '../../../constant.dart';
import '../Login/utils/text_utils.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _shop_nameController =TextEditingController();
  final _shop_merchantController =TextEditingController();
  final _emailControllerller =TextEditingController();
  final _phoneController =TextEditingController();
  final _passwordController  =TextEditingController();
  final _conPassController  =TextEditingController();
  final _descriptionController =TextEditingController();
  final _statusController =TextEditingController();
  final _fb_linkController =TextEditingController();
  final _plan_nameController =TextEditingController();
  final _area_nameController =TextEditingController();
  final _pickup_typeController =TextEditingController();
  final _cod_chargeController =TextEditingController();
  final _trans_methodController =TextEditingController();
  final _bank_ac_numberController =TextEditingController();
  final _bank_nameController =TextEditingController();
  final _bankaccount_nameController =TextEditingController();
  final _routing_noController =TextEditingController();
  final _account_typeController =TextEditingController();
  final _branchController =TextEditingController();
  final _picup_addressController =TextEditingController();
  bool f1=false;
  bool f2=false;
  bool f3=false;
  bool f4=false;
  File ? _image;
  File ? _nidback;
  File ? _shopelicenc;
  File ? NIDBACK;
  File ? NIDFONT;
  File ? imagee;
  final picker = ImagePicker();
  final _formkey=GlobalKey<FormState>();

  ///NID font
  Future getImageFromGallery() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _image = File(pickedFile.path);
      }
    });
  }

  ///NID BAck
  Future getImageFromGallery2() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _nidback = File(pickedFile.path);
      }
    });
  }

  ///Shop licence
  Future getImageFromGallery3() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        _shopelicenc = File(pickedFile.path);
      }
    });
  }

  ///  NID
  Future NIDBACKimage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        NIDBACK = File(pickedFile.path);
      }
    });
  }
  ///  NID
  Future NIDFONTimage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    setState(() {
      if (pickedFile != null) {
        NIDFONT = File(pickedFile.path);
      }
    });
  }
  @override
  void initState() {
    Provider.of<E_Currier_Provierd>(context,listen: false).PickupAreaProvider(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final PickupArea= Provider.of<E_Currier_Provierd>(context).PickupArea;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        leading: Icon(Icons.add,color:Colors.white,),
        title: CustomText(text: "Register", fontSize: 25, fontWeight: FontWeight.w900,letterSpacing: 0.2,color: Colors.black,)),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        padding: EdgeInsets.all(10),
        decoration:  BoxDecoration(

        ),
        alignment: Alignment.center,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 15),
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
            color: Colors.black.withOpacity(0.1),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: BackdropFilter(filter:ImageFilter.blur(sigmaY: 5,sigmaX: 5),
                child:Container(
                  padding: EdgeInsets.all(10),
                  margin: EdgeInsets.all(10),
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formkey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 15,),
                          // f1==false?
                          // Container(
                          // child: Column(
                          //   children: [
                          //     CustomTextfieldForm(name: "Shop Name", obscureText: false,controller: _shop_nameController),
                          //     CustomTextfieldForm(name: "Merchant Name", obscureText: false,controller: _shop_merchantController,),
                          //     CustomTextfieldForm(name: "Mobile Number", obscureText: false,controller: _phoneController,keyboardType: TextInputType.number),
                          //     CustomTextfieldForm(name: "Shop Email", obscureText: false,controller: _emailControllerller),
                          //     CustomTextfieldForm(name: "FB Link", obscureText: false,controller: _fb_linkController),
                          //     CustomTextfieldForm(name: "Cod Charge", obscureText: false,controller: _cod_chargeController,keyboardType: TextInputType.number),
                          //     CustomTextfieldForm(name: "Account no/M number", obscureText: false,controller: _bank_ac_numberController,keyboardType: TextInputType.number),
                          //     CustomTextfieldForm(name: "Bank Name", obscureText: false,controller: _bank_nameController),
                          //     CustomTextfieldForm(name: "Account Name", obscureText: false,controller: _bankaccount_nameController),
                          //     CustomTextfieldForm(name: "Routing No", obscureText: false,controller: _routing_noController,keyboardType: TextInputType.number),
                          //
                          //     f4==true?Container():
                          //
                          //     CustomButton(onTap: () {
                          //       setState(() {
                          //         f2=true;
                          //         f1=true;
                          //       });
                          //     }, text: "Submit", button_text_fontSize: 16, button_height: 50)
                          //   ],
                          // ),
                          // )
                          //     :
                          // f2==true?
                          // Container(
                          // child: Column(
                          //   children: [
                          //     CustomTextfieldForm(name: "Account Type", obscureText: false,controller: _account_typeController),
                          //     CustomTextfieldForm(name: "Branch", obscureText: false,controller: _branchController),
                          //     CustomTextfieldForm(name: "Pickup Address", obscureText: false,controller: _picup_addressController),
                          //     //  CustomTextfieldForm(name: "Status", obscureText: false,controller: _statusController,keyboardType: TextInputType.number),
                          //     /// image section
                          //     InkWell(
                          //       onTap: () {
                          //         getImageFromGallery();
                          //       },
                          //       child: Row(
                          //         children: [
                          //           CustomText(text: "Photo              ",color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
                          //           Container(
                          //             height: 80,
                          //             width: 150,
                          //             margin: EdgeInsets.all(10),
                          //             decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(20),
                          //               color: Colors.white,
                          //             ),
                          //
                          //             child: _image==null? Icon(Icons.camera_alt_outlined,size: 32,):
                          //             ClipRRect(
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 child: Image.file(_image!.renameSync(_image!.path),fit: BoxFit.fill,)),
                          //
                          //             //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         getImageFromGallery2();
                          //       },
                          //       child: Row(
                          //         children: [
                          //           CustomText(text: "Cover Photo",color: Colors.white ,fontSize: 20, fontWeight: FontWeight.bold),
                          //           Container(
                          //             height: 80,
                          //             width: 150,
                          //             margin: EdgeInsets.all(10),
                          //             decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(20),
                          //               color: Colors.white,
                          //             ),
                          //             child: _nidback==null? Icon(Icons.camera_alt_outlined,size: 32,):
                          //             ClipRRect(
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 child: Image.file(_nidback!.renameSync(_nidback!.path),fit: BoxFit.fill,)),
                          //
                          //             //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         getImageFromGallery3();
                          //       },
                          //       child: Row(
                          //         children: [
                          //           CustomText(text: "Shop Licence   ",color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          //           Container(
                          //             height: 80,
                          //             width: 150,
                          //             margin: EdgeInsets.all(10),
                          //             decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(20),
                          //               color: Colors.white,
                          //             ),
                          //
                          //             child: _shopelicenc==null? Icon(Icons.camera_alt_outlined,size: 32,):
                          //             ClipRRect(
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 child: Image.file(_shopelicenc!.renameSync(_shopelicenc!.path),fit: BoxFit.fill,)),
                          //
                          //             //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //     InkWell(
                          //       onTap: () {
                          //         getImageFromGallery4();
                          //       },
                          //       child: Row(
                          //         children: [
                          //           CustomText(text: "NID                         ",color: Colors.white, fontSize: 17, fontWeight: FontWeight.bold),
                          //           Container(
                          //             height: 80,
                          //             width: 150,
                          //             margin: EdgeInsets.all(10),
                          //             decoration: BoxDecoration(
                          //               borderRadius: BorderRadius.circular(20),
                          //               color: Colors.white,
                          //             ),
                          //
                          //             child: NIDCARD==null? Icon(Icons.camera_alt_outlined,size: 32,):
                          //             ClipRRect(
                          //                 borderRadius: BorderRadius.circular(10),
                          //                 child: Image.file(NIDCARD!.renameSync(NIDCARD!.path),fit: BoxFit.fill,)),
                          //
                          //             //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                          //           ),
                          //         ],
                          //       ),
                          //     ),
                          //
                          //     f4==true?Container():     CustomButton(onTap: () {
                          //       setState(() {
                          //         f2=false;
                          //         f3=true;
                          //       });
                          //     }, text: "Submit", button_text_fontSize: 16, button_height: 50)
                          //
                          //   ],
                          // ),
                          // )
                          //
                          //      :
                           Container(
                             child: Column(
                               children: [
                                 Container(
                                   child: Column(
                                     children: [
                                       Container(
                                         height: 38,
                                         width: double.infinity,
                                         child: Row(
                                           children: [
                                             Expanded(
                                                 flex: 2,
                                                 child: CustomText(text: "Shop Name", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                                             Expanded(
                                               flex: 3,
                                               child: CustomTextFormFieldd(
                                                 readOnly: false,
                                                 maxline: 1, height: 38, hintext: "Enter name", controller:_shop_nameController , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                               },),
                                             )
                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 15,),
                                       Container(
                                         height: 38,
                                         width: double.infinity,
                                         child: Row(
                                           children: [
                                             Expanded(
                                                 flex: 2,
                                                 child: CustomText(text: "Merchant Name", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                                             Expanded(
                                               flex: 3,
                                               child: CustomTextFormFieldd(
                                                 readOnly: false,
                                                 maxline: 1, height: 38, hintext: "Enter name", controller:_shop_merchantController , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                               },),
                                             )
                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 15,),

                                       Container(
                                         height: 38,
                                         width: double.infinity,
                                         child: Row(
                                           children: [
                                             Expanded(
                                                 flex: 2,
                                                 child: CustomText(text: "Mobile number", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                                             Expanded(
                                               flex: 3,
                                               child: CustomTextFormFieldd(
                                                 readOnly: false,
                                                 maxline: 1, height: 38, hintext: " ", controller:_phoneController , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                               },),
                                             )
                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 15,),

                                       Container(
                                         height: 38,
                                         width: double.infinity,
                                         child: Row(
                                           children: [
                                             Expanded(
                                                 flex: 2,
                                                 child: CustomText(text: "Shop Email", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                                             Expanded(
                                               flex: 3,
                                               child: CustomTextFormFieldd(
                                                 readOnly: false,
                                                 maxline: 1, height: 38, hintext: " ", controller:_emailControllerller , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                               },),
                                             )
                                           ],
                                         ),
                                       ),
                                       SizedBox(height: 15,),
                                       
                                       /// pickarea dropdown
                                       Container(
                                         margin: EdgeInsets.only(top: 10),
                                         height: 50,
                                         width: double.infinity,
                                         padding: EdgeInsets.only(left: 15, right: 15),
                                         decoration: BoxDecoration(
                                             borderRadius: BorderRadius.circular(11),
                                             border: Border.all(color:Colors.white,width: 2),
                                             color: Colors.white
                                         ),
                                         child: IgnorePointer(
                                           ignoring: false,
                                           child: DropdownButton(
                                             enableFeedback: true,
                                             autofocus: false,
                                             isExpanded: true,
                                             hint: InkWell(
                                                 onTap: () {}, child: Text('Select Pickup Area')),
                                             // Not necessary for Option 1
                                             value: pickarea,
                                             onChanged: (newValue) {
                                               setState(() {
                                                 pickarea = newValue.toString();

                                               });
                                             },
                                             items:PickupArea.map((location) {
                                               return DropdownMenuItem(
                                                 child: Card(
                                                     child: Container(
                                                       width: double.infinity,
                                                       padding: const EdgeInsets.all(8.0),
                                                       child: Text("${location["name"] ?? ""}"),
                                                     )),
                                                 value: "${location["id"]}",
                                               );
                                             }).toList(),
                                           ),
                                         ),
                                       ),
                                     ],
                                   ),
                                 ),

                                 Container(
                                   child: Column(
                                     children: [
                                       /// image section
                                       InkWell(
                                         onTap: () {
                                           getImageFromGallery();
                                         },
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             CustomText(text: "Photo              ",color: Colors.red, fontSize: 20, fontWeight: FontWeight.bold),
                                             Expanded(
                                               child: Container(
                                                 height: 80,
                                                 width: 150,
                                                 margin: EdgeInsets.all(10),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20),
                                                   color: Colors.white,
                                                 ),
                                               
                                                 child: _image==null? Icon(Icons.camera_alt_outlined,size: 32,):
                                                 ClipRRect(
                                                     borderRadius: BorderRadius.circular(10),
                                                     child: Image.file(_image!.renameSync(_image!.path),fit: BoxFit.fill,)),
                                               
                                                 //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),

                                       /// shop licence
                                       InkWell(
                                         onTap: () {
                                           getImageFromGallery3();
                                         },
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             CustomText(text: "Shop Licence   ",color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
                                             Expanded(
                                               child: Container(
                                                 height: 80,
                                                 width: 150,
                                                 margin: EdgeInsets.all(10),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20),
                                                   color: Colors.white,
                                                 ),
                                               
                                                 child: _shopelicenc==null? Icon(Icons.camera_alt_outlined,size: 32,):
                                                 ClipRRect(
                                                     borderRadius: BorderRadius.circular(10),
                                                     child: Image.file(_shopelicenc!.renameSync(_shopelicenc!.path),fit: BoxFit.fill,)),
                                               
                                                 //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       /// NID FONT
                                       InkWell(
                                         onTap: () {
                                           NIDFONTimage();
                                         },
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             CustomText(text: "NID FONT           ",color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
                                             Expanded(
                                               child: Container(
                                                 height: 80,
                                                 width: 150,
                                                 margin: EdgeInsets.all(10),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20),
                                                   color: Colors.white,
                                                 ),
                                               
                                                 child: NIDFONT==null? Icon(Icons.camera_alt_outlined,size: 32,):
                                                 ClipRRect(
                                                     borderRadius: BorderRadius.circular(10),
                                                     child: Image.file(NIDFONT!.renameSync(NIDFONT!.path),fit: BoxFit.fill,)),
                                               
                                                 //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       /// NID BACK
                                       InkWell(
                                         onTap: () {
                                           NIDBACKimage();
                                         },
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             CustomText(text: "NID BACK         ",color: Colors.red, fontSize: 17, fontWeight: FontWeight.bold),
                                             Expanded(
                                               child: Container(
                                                 height: 80,
                                                 width: 150,
                                                 margin: EdgeInsets.all(10),
                                                 decoration: BoxDecoration(
                                                   borderRadius: BorderRadius.circular(20),
                                                   color: Colors.white,
                                                 ),
                                               
                                                 child: NIDBACK==null? Icon(Icons.camera_alt_outlined,size: 32,):
                                                 ClipRRect(
                                                     borderRadius: BorderRadius.circular(10),
                                                     child: Image.file(NIDBACK!.renameSync(NIDBACK!.path),
                                                       fit: BoxFit.fill,)),
                                               
                                                 //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                                               ),
                                             ),
                                           ],
                                         ),
                                       ),
                                       /// Password section
                                       ///
                                       CustomTextfieldForm(name: "Password", obscureText: false,controller: _passwordController),
                                       CustomTextfieldForm(name: "Confirm Password", obscureText: false,controller: _conPassController),

                                       SizedBox(height: 20,),
                                       is_clicked_register==true?CircularProgressIndicator(

                                       ):    CustomButton(onTap: () {
                                         if(_formkey.currentState!.validate()  &&
                                         pickarea!=null  ){

                                           if(_passwordController.text.length>7){
                                             if(_passwordController.text==_conPassController.text){
                                               registerSeller();
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

                                         }else{
                                           Flushbar(
                                             flushbarPosition: FlushbarPosition.TOP,
                                             title:  "Please fill all the field",
                                             message:  "Try again ...",
                                             duration:  Duration(seconds: 1),
                                           )..show(context);
                                         }

                                       }, text: "Register", button_text_fontSize: 16, button_height: 50),
                                       is_clicked_register==true?Container():    SizedBox(height: 15,),
                                       is_clicked_register==true?Container():      InkWell(
                                           onTap: () {
                                             Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
                                           },
                                           child: Center(child: TextUtil(text: "Do you have an account LOGIN",size: 12,weight: true,))),
                                     ],
                                   ),
                                 )
                               ],
                             ),
                           ),


                        ],
                      ),
                    ),
                  ),
                ) ,
              ),
            ),
          ),
      ),
    );
  }
 List planlist=[1,2,3,4,5];
  String ? planid;

 List pickareaList=[1,2,3,4,5];
  String ? pickarea;

 List transectionlist=["CASH","BKASH","BANK","ROKET","NAGAD","CHEQUE"];
  String ? transection;
  String ?  selectedDatee;
  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        firstDate: DateTime(1900, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDatee) {
      final df = new DateFormat('yyyy-MM-dd');
      setState(() {
        selectedDatee =df.format(picked);
      });
    }
  }
  registerSeller() async {
    try{
      final uri = Uri.parse("${BaseUrl}/api/marchentregister");
      var request = http.MultipartRequest("POST",uri);
      request.headers.addAll({
        "accept": "application/json",

      });

      request.fields['shop_name'] = _shop_nameController.text.toString();
      request.fields['name'] = _shop_merchantController.text.toString();
      request.fields['email'] = _emailControllerller.text.toString();
      request.fields['phone'] = _phoneController.text.toString();
      request.fields['password'] = _passwordController.text.toString();
      request.fields['description'] = _descriptionController.text.toString();
      request.fields['status'] = "1";
      request.fields['fb_link'] = _fb_linkController.text.toString();
      request.fields['plan_name'] = planid.toString();
      request.fields['area_name'] = pickarea.toString();
      request.fields['pickup_type'] = _pickup_typeController.text.toString();
      request.fields['cod_charge'] = _cod_chargeController.text.toString();
      request.fields['trans_method'] = transection.toString();
      request.fields['bank_ac_number'] = _bank_ac_numberController.text.toString();
      request.fields['bank_name'] = _bank_nameController.text.toString();
      request.fields['bankaccount_name'] = _bankaccount_nameController.text.toString();
      request.fields['routing_no'] = _routing_noController.text.toString();
      request.fields['account_type'] = _account_typeController.text.toString();
      request.fields['branch'] = _branchController.text.toString();
      request.fields['picup_address'] = _picup_addressController.text.toString();

      var nid_cardd = await http.MultipartFile.fromPath('image', _image!.path.toString());
      request.files.add(nid_cardd);
      var father_nidd = await http.MultipartFile.fromPath('nid_back', NIDBACK!.path.toString() );
      request.files.add(father_nidd);
      var driving_licensed = await http.MultipartFile.fromPath('nid', NIDFONT!.path.toString() );
      request.files.add(driving_licensed);

      var trade_licence = await http.MultipartFile.fromPath('trade_licence', _shopelicenc!.path.toString() );
      request.files.add(trade_licence);


      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxx ${response.statusCode}");
         if(response.statusCode==200){
           Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
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
      print("Catch Error $erroe");
    }
  }
  bool is_clicked=false;
  bool is_clicked_register=false;
}


