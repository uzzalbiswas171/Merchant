
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:spelling_number/spelling_number.dart';

import '../../N_CustomWidget/CustomText/custom_text.dart';
import '../../constant.dart';

class InvoiceScreen extends StatefulWidget {
  InvoiceScreen({super.key,required this.map});
  Map map;
  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

 
 
    return SafeArea(
      child: Scaffold(
        body: RefreshIndicator( onRefresh: () {
          return Future(() => () {

          });
        },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 40,bottom: 30),
                  height: 35,
                  alignment: Alignment.center,
                  width: double.infinity,
                  child: ListTile(
                      leading: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image(image: AssetImage("assets/back 2.png"),height: 30,width: 30,)),
                      title: Center(child: CustomText(text: "Invoice", fontSize: 25, fontWeight: FontWeight.w800,letterSpacing: 0.2,))),
                ),
                ///Search bar
                Divider(height: 3,color: Colors.grey.withOpacity(0.5),),
                Container(
                  height: 112,
                  width: double.infinity,
                  padding: EdgeInsets.only(
                    left: 15,
                    right: 15,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(text: "From", fontSize: 18, fontWeight: FontWeight.bold),
                          CustomText(text: "${custom_text}", fontSize: 18, fontWeight: FontWeight.bold),
                          QrImageView(
                            data: '${"#OC${widget.map["parcel_id"]}"}',
                            version: QrVersions.auto,
                            size: 60.0,
                          ),
                        ],
                      )
                      ),
                      Expanded(child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                      CustomText(text: "to", fontSize: 18, fontWeight: FontWeight.bold),
                      CustomText(text: "${widget.map["parcel"]["customer_name"]}", fontSize: 18, fontWeight: FontWeight.bold),
                      CustomText(text: "${widget.map["parcel"]["customer_phone"]}", fontSize: 18, fontWeight: FontWeight.bold),
                      CustomText(text: "${widget.map["parcel"]["customer_address"]}", fontSize: 18, fontWeight: FontWeight.bold),
                        ],
                      )),
                    ],
                  ),
                ),
            //   Divider(height: 3,color: Colors.grey.withOpacity(0.5),),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Table(
                      border: TableBorder.all(), // Allows to add a border decoration around your table
                      children: [
                        TableRow(children :[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "Category", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "weight", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: Center(child: CustomText(text: "Quantity", fontSize: 15, fontWeight: FontWeight.bold)),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "Price", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        ]),

                        TableRow(children :[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "${widget.map["parcel"]["category"]["name"]}", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "${widget.map["parcel"]["weight"]}", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        // Padding(
                        //   padding: const EdgeInsets.all(5.0),
                        //   child: Center(child: CustomText(text:"${widget.map["parcel"]["quantity"]}", fontSize: 15, fontWeight: FontWeight.bold)),
                        // ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "${widget.map["parcel"]["cash"]}", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        ]),
                      ]
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15.0,right: 15),
                  child: Table(
                      border: TableBorder.all(), // Allows to add a border decoration around your table
                      children: [
                        TableRow(children :[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "Sub Total", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "${widget.map["parcel"]["cash"]}", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),

                        ]),

                        TableRow(children :[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "Delivery Charge", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text:  "${widget.map["parcel"]["delivery_charge"]}", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        ]),

                        TableRow(children :[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "Cod Charge", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child:
                           CustomText(text: "${double.parse("${double.parse("${widget.map["parcel"]["cash"]}")*(double.parse("${double.parse("${GetStorage().read("GetProfile")["cod_charge"]?? GetStorage().read("GetProfile")['admin']["cod_charge"]??"0"}")}")/100)}").toStringAsFixed(0)}", fontSize: 15, fontWeight: FontWeight.w400),
                          ),
                        ),
                        ]),
                        TableRow(children :[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "Total", fontSize: 15, fontWeight: FontWeight.bold)),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Center(child: CustomText(text: "${double.parse("${widget.map["parcel"]["cash"]}")-double.parse("${widget.map["parcel"]["delivery_charge"]}")- double.parse("${double.parse("${widget.map["parcel"]["cash"]}")*(double.parse("${double.parse("${GetStorage().read("GetProfile")["cod_charge"]?? GetStorage().read("GetProfile")['admin']["cod_charge"]??"0"}")}")/100)}")}", fontSize: 15, fontWeight: FontWeight.bold)),
                          ),
                        ]),
                      ]
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                  child: CustomText(text: "In Word : ${SpellingNumber().convert(int.parse("${double.parse("${double.parse("${widget.map["parcel"]["cash"]}")-double.parse("${widget.map["parcel"]["delivery_charge"]}")- double.parse("${double.parse("${widget.map["parcel"]["cash"]}")*(double.parse("${double.parse("${GetStorage().read("GetProfile")["cod_charge"]?? GetStorage().read("GetProfile")['admin']["cod_charge"]??"0"}")}")/100)}")}").toStringAsFixed(0)}"))} TAKA", fontSize: 18,maxLines: 2, fontWeight: FontWeight.w700,letterSpacing: 0.2),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                  child:  Text( "Note : ${widget.map["note"]}",style: GoogleFonts.poppins(
                      fontSize: 18, fontWeight: FontWeight.w700,letterSpacing: 0.2
                  ),
                     ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 20,left: 15,right: 15),
                  alignment: Alignment.centerRight,
                  child: CustomText(text: "Date : ${widget.map["parcel"]["date"]}", fontSize: 18, fontWeight: FontWeight.w700,letterSpacing: 0.2),
                ),

              ],
            ),
          ),

        ),
      ),
    );
  }
}
