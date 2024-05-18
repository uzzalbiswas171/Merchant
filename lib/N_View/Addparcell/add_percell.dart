import 'package:another_flushbar/flushbar.dart';
import 'package:e_currier/N_Statemanagement/e_currier_provider.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../CustomButton/custom_button.dart';
import '../../N_CustomWidget/CustomText/custom_text.dart';
import '../../N_CustomWidget/custom_text_formfield.dart';
import '../../constant.dart';
import 'dart:convert';
import 'dart:ui';
import 'dart:io';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

import '../Auth/Login/utils/text_utils.dart';
import '../HomeScreen/home_screen.dart';

class AddPercellScreen extends StatefulWidget {
  const AddPercellScreen({super.key});

  @override
  State<AddPercellScreen> createState() => _AddPercellScreenState();
}

class _AddPercellScreenState extends State<AddPercellScreen> {
  final customer_name =TextEditingController();
  final customer_phone =TextEditingController();
  final customer_address =TextEditingController();
  final weight =TextEditingController();
  final parcel_area  =TextEditingController();
  // final quantity =TextEditingController();
  final cash =TextEditingController();
  final sell =TextEditingController();
  final delivery_charge =TextEditingController();
  final instruction =TextEditingController();


  final date =TextEditingController();
  final status =TextEditingController();
  final admin_id =TextEditingController();

  bool f1=false;
  bool f2=false;
  bool f3=false;
  bool f4=false;
  File ? _image;

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


@override
  void initState() {
  Provider.of<E_Currier_Provierd>(context,listen: false).divisionProvider("api_end_point", context, true);
  Provider.of<E_Currier_Provierd>(context,listen: false).category_listProvider(context);
  Provider.of<E_Currier_Provierd>(context,listen: false).plan_listProvider(context);
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final plan_list=  Provider.of<E_Currier_Provierd>(context,listen: false).plan_list;
    final category_list=  Provider.of<E_Currier_Provierd>(context,listen: false).category_list;
    print("tokennnnnnnnnnnnnnnnnnnnnnnnn ${GetStorage().read("Api_token")}");
    List planlist = Provider.of<E_Currier_Provierd>(context).divisionList;
    List pickareaList = Provider.of<E_Currier_Provierd>(context).districtList;
    List transectionlist = Provider.of<E_Currier_Provierd>(context).thanalist;
    print("plan_list         ${plan_list}");
    print("Division         ${planlist}");
    print("BBBBBBBBBBBBBBBBBBB ${pickareaList}");
    print("BBBBBBBBBBBBBBBBBBB ${pickareaList}");
    return Scaffold(
        body:Container(

          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
              color: redColor,
            //  image: DecorationImage(image: AssetImage("assets/bg6.jpeg"),fit: BoxFit.fill)

          ),

          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  height: 220,
                  width: double.infinity,
                  child: Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(top: 40,left: 15),
                        alignment: Alignment.centerLeft,
                        child: CustomText(text: "Create Parcel", fontSize: 28, fontWeight: FontWeight.w600,letterSpacing: 2,color: Colors.white,),
                      )   ,
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: CircleAvatar(
                          radius: 56,
                          backgroundImage: AssetImage("assets/payment reqpuest 1.png"),
                        ),
                      ),
                    ],
                  ),
                ),
                Container(

                  padding: EdgeInsets.all(15),
                  decoration: BoxDecoration(
                      color: figma_white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(45),
                      topRight: Radius.circular(45)
                    )
                  ),
                  child: Form(
                    key: _formkey,
                    child:  Column(
                      children: [
                        Container(
                          margin: EdgeInsets.only(
                            bottom: 15
                          ),
                          height: 38,
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Customer Name", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller:customer_name , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 38,
                          margin: EdgeInsets.only(
                              bottom: 15
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Customer Phone", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller:customer_phone , obscureText: false, keyboardType: TextInputType.phone, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 38,
                          margin: EdgeInsets.only(
                              bottom: 15
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Customer Address", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller:customer_address , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 38,
                          margin: EdgeInsets.only(
                              bottom: 15
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Weight", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller:weight , obscureText: false, keyboardType: TextInputType.number, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 38,
                          margin: EdgeInsets.only(
                              bottom: 15
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Parcel area", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller:parcel_area , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                        ),
                        /// Parcel type list
                        Container(
                          height: 50,
                          width: double.infinity,
                         //
                          // padding: EdgeInsets.only(left: 15, right: 15),
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
                                  onTap: () {}, child:Text('Parcel type',style: TextStyle(
                                color: customredcolor,
                              ))),
                              // Not necessary for Option 1
                              value: percel_id,
                              onChanged: (newValue) {
                                setState(() {
                                  percel_id = newValue.toString();
                                });
                              },
                              items:percel_list.map((location) {
                                return DropdownMenuItem(
                                  child: Card(
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${location}"),
                                      )),
                                  value: "${location}",
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        /// Category list
                        Container(
                          margin: EdgeInsets.only(bottom: 10),
                          height: 50,
                          width: double.infinity,
                       //   padding: EdgeInsets.only(left: 15, right: 15),
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
                                  onTap: () {}, child: Text('Select Category',style: TextStyle(
                                color: customredcolor,
                              ))),
                              // Not necessary for Option 1
                              value: categoryid,
                              onChanged: (newValue) {
                                setState(() {
                                  categoryid = newValue.toString();

                                });
                              },
                              items:category_list.map((location) {
                                return DropdownMenuItem(
                                  child: Card(
                                      child: Container(
                                        width: double.infinity,
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("${location["name"]}"),
                                      )),
                                  value: "${location["id"]}",
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                        Container(
                          height: 38,
                          margin: EdgeInsets.only(
                              bottom: 15
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Cash", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller:cash , obscureText: false, keyboardType: TextInputType.number, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                        ),
                        Container(
                          height: 38,
                          margin: EdgeInsets.only(
                              bottom: 15
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Sell", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller:sell , obscureText: false, keyboardType: TextInputType.number, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                        ),
                        /// Delivery Charge
                        Container(
                          height: 38,
                          margin: EdgeInsets.only(
                              bottom: 15
                          ),
                          width: double.infinity,
                          child: Row(
                            children: [
                              Expanded(
                                  flex: 2,
                                  child: CustomText(text: "Instruction", fontSize: 15, fontWeight: FontWeight.w700,color: customredcolor,)),
                              Expanded(
                                flex: 3,
                                child: CustomTextFormFieldd(
                                  readOnly: false,
                                  maxline: 1, height: 38, hintext: "", controller:instruction , obscureText: false, keyboardType: TextInputType.text, onChanged: (value) {

                                },),
                              )
                            ],
                          ),
                        ),
                         // CustomTextfieldForm(name: "date", obscureText: false,controller: date),
                     //   CustomTextfieldForm(name: "status", obscureText: false,controller: status,keyboardType: TextInputType.number),
                      //  CustomTextfieldForm(name: "admin_id", obscureText: false,controller: admin_id),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: TextFieldColor
                          ),
                          height: 50,
                          width: double.infinity,
                          child:  ElevatedButton(onPressed: () {
                            _selectDate(context);
                          }, child: CustomText(text: selectedDatee==null?'Select Date' : "${selectedDatee}", fontSize: 16, fontWeight: FontWeight.bold,color: customredcolor))

                        ),
                        Container(
                          child: Column(
                            children: [
                              ///  Division
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                width: double.infinity,
                              //  padding: EdgeInsets.only(left: 15, right: 15),
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
                                        onTap: () {}, child: Text('Select Division',style: TextStyle(
                                      color: customredcolor,
                                    ),)),
                                    // Not necessary for Option 1
                                    value: division_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        district_id=null;
                                        upazilla_id=null;
                                        division_id = newValue.toString();
                                        Provider.of<E_Currier_Provierd>(context,listen: false).districtProvider("/api/district?division_id=${division_id}", context, true);

                                      });
                                    },
                                    items:planlist.map((location) {
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
                              /// District
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                width: double.infinity,
                              //  padding: EdgeInsets.only(left: 15, right: 15),
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
                                        onTap: () {}, child: Text('Select Distriict',style: TextStyle(
                                      color: customredcolor,
                                    ))),
                                    // Not necessary for Option 1
                                    value: district_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        upazilla_id=null;
                                        district_id = newValue.toString();
                                        Provider.of<E_Currier_Provierd>(context,listen: false).thanaProvider("/api/upazilla?district_id=${district_id}", context, true);


                                      });
                                    },
                                    items:pickareaList.map((location) {
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
                              /// Thana
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                height: 50,
                                width: double.infinity,
                              //  padding: EdgeInsets.only(left: 15, right: 15),
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
                                        onTap: () {}, child:const Text('Select Upzila',style: TextStyle(
                                      color: customredcolor,
                                    ))),
                                    // Not necessary for Option 1
                                    value: upazilla_id,
                                    onChanged: (newValue) {
                                      setState(() {
                                        upazilla_id = newValue.toString();

                                      });
                                    },
                                    items:transectionlist.map((location) {
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

                              /// Image
                              InkWell(
                                onTap: () {
                                  getImageFromGallery();
                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(text: "Image",color: redColor, fontSize: 20, fontWeight: FontWeight.bold),
                                    Container(
                                      height: 80,
                                      width: 150,
                                      margin: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(20),
                                        color: TextFieldColor,
                                      ),

                                      child: _image==null? Icon(Icons.camera_alt_outlined,size: 32,):
                                      ClipRRect(
                                          borderRadius: BorderRadius.circular(10),
                                          child: Image.file(_image!.renameSync(_image!.path),fit: BoxFit.fill,)),

                                      //child:  _courseImage==null? Icon(Icons.camera_alt_outlined,size: 32,):Center(child: Image.file("_imageeurl")),
                                    ),
                                  ],
                                ),
                              ),

                              SizedBox(height: 10,),
                              is_clicked_register==true?CircularProgressIndicator(

                              ):    CustomButton(onTap: () {
                                if(_formkey.currentState!.validate() && percel_id!=null && categoryid!=null){
                                  registerSeller();
                                  district_id=null;
                                  upazilla_id=null;
                                  setState(() {
                                    is_clicked_register=true;
                                  });
                                }else{
                                  Flushbar(
                                    flushbarPosition: FlushbarPosition.TOP,
                                    title:  "Please fill all the field",
                                    message:  "Try again ...",
                                    duration:  Duration(seconds: 1),
                                  )..show(context);
                                }

                              }, text: "Parcel Add", button_text_fontSize: 16, button_height: 50),
                              SizedBox(height: 100,),
                           ],
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        )
    );
  }
  bool is_clicked_register=false;

  String? percel_id ;
  String? categoryid  ;
  String? division_id  ;
  String? district_id  ;
  String? upazilla_id  ;


  List percel_list=["Fragile","Liquid", "Package"];

  String ?  selectedDatee="${DateTime.now()}";
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

  functionval()async{
    var request = http.MultipartRequest("POST",uri);
    var nid_cardd = await http.MultipartFile.fromPath('image', _image!.path.toString());
    request.files.add(nid_cardd);
  }
  dun(){}
  final uri = Uri.parse("${BaseUrl}/api/auth/parcel_store");
  registerSeller() async {
print("ffffffffffffffffffffffffffffff $division_id");
print("ffffffffffffffffffffffffffffff $district_id");
print("ffffffffffffffffffffffffffffff $upazilla_id");
print("ffffffffffffffffffffffffffffff $selectedDatee");
    try{
      var request = http.MultipartRequest("POST",uri);
      request.headers.addAll({
        "accept": "application/json",
        'Authorization': 'Bearer ${GetStorage().read("Api_token")}'
      });
      showDialog(
        barrierDismissible: false,
        context: context, builder: (context) =>const AlertDialog(
          title: Text("Parcel Add Processing"),actions: [
        Center(
          child: CircularProgressIndicator(),
        )
      ]),);
      request.fields['customer_name'] = customer_name.text.toString();
      request.fields['customer_phone'] = customer_phone.text.toString();
      request.fields['customer_address'] = customer_address.text.toString();
      request.fields['weight'] = weight.text.toString();
      request.fields['parcel_area'] = parcel_area.text.toString();
      request.fields['parcel_type'] = percel_id=="Fragile"?"0":"1";
      request.fields['category_id'] = categoryid.toString();
      // request.fields['quantity'] = quantity.text.toString();
      request.fields['cash'] = cash.text.toString();
      request.fields['sell'] = sell.text.toString();
      request.fields['delivery_charge'] = "";
      request.fields['instruction'] = instruction.text.toString();
      request.fields['division_id'] = division_id.toString();
      request.fields['district_id'] = district_id.toString();
      request.fields['upazilla_id'] = upazilla_id.toString();
      request.fields['date'] = selectedDatee.toString();
      request.fields['status'] = "0";
      request.fields['admin_id'] = admin_id.text.toString();

      "${_image}"=="null"?dun(): functionval();
      var response = await request.send();
      var responseData = await response.stream.toBytes();
      var responseString = String.fromCharCodes(responseData);
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxx ${response.stream}");
      print("xxxxxxxxxxxxxxxxxxxxxxxxxxx ${response.statusCode}");
      if(response.statusCode==200){
       Navigator.push(context, MaterialPageRoute(builder: (context) => HomeScreen(),));
      }else{
        setState(() {
          is_clicked_register=false;
        });
      }
      var  data = jsonDecode(responseString);
      if(data["message"]=="The given data was invalid."){
        setState(() {
          Navigator.pop(context);
          setState(() {
            is_clicked_register=false;
          });
        });
        Flushbar(
          flushbarPosition: FlushbarPosition.TOP,
          title:  "${data["message"]}",
          message:  "Please Wait ...",
          duration:  Duration(seconds: 1),
        )..show(context);
      }else{

      }
      print("=====Parcel=========>$data");
    }catch(erroe){

      setState(() {
        Navigator.pop(context);
        is_clicked_register=false;
      });
      print("Catch Error $erroe");
    }
  }
}
