import 'package:e_currier/CustomButton/custom_button.dart';
import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../N_Statemanagement/e_currier_provider.dart';
import '../../constant.dart';

class BalanchScreen extends StatefulWidget {
  const BalanchScreen({super.key});

  @override
  State<BalanchScreen> createState() => _BalanchScreenState();
}

class _BalanchScreenState extends State<BalanchScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final balenceHistory=  Provider.of<E_Currier_Provierd>(context).balenceHistory;
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(75), child: AppBar(
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Image(image: AssetImage("assets/back 2.png"),height: 30,width: 30,)),
        title: CustomText(text: "Balance History", fontSize: 25, fontWeight: FontWeight.w800,letterSpacing: 0.2,),
      )),
      body: "${balenceHistory}"=="null"?Center(child: CircularProgressIndicator(),):

      RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1),() {
            Provider.of<E_Currier_Provierd>(context,listen: false).balenceHistoryProvider(context);
          },);
        },
        child: Container(
          height: double.infinity,
          width: double.infinity,
          child: Column(

            children: [
              SizedBox(height: 25,),
                Container(
                  margin: EdgeInsets.all(15),
                  padding: EdgeInsets.all(15),
                  height: 240,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Color(0xffFEEDED),
                    border: Border.all(
                      width: 1.5,
                      style: BorderStyle.solid,
                      color: Colors.black54
                    )
                  ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   crossAxisAlignment: CrossAxisAlignment.center,
                   children: [
                     Container(
                       height:26,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         CustomText(text: "Amount Delivered", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                         CustomText(text: "${balenceHistory["amount_deliverde"]}", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
                       ],),
                     ),
                     Divider(),
                     Container(
                       height:26,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         CustomText(text: "Payable Delivery Charge", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                         CustomText(text: "${balenceHistory["payable_deliveryCharge"]}", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
                       ],),
                     ),
                     Divider(),
                     Container(
                       height:26,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         CustomText(text: "Sub-Total", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                         CustomText(text: "${balenceHistory["subtotal"]}", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
                       ],),
                     ),
                     Divider(),
                     Container(
                       height:26,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         CustomText(text: "COD Charge", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                         CustomText(text: "${balenceHistory["cod_charge"]}", fontSize: 18, fontWeight: FontWeight.w600,letterSpacing: 0.2,)
                       ],),
                     ),
                     Divider(),
                     Container(
                       height:26,
                       child: Row(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                         children: [
                         CustomText(text: "Available Balance (BDT)", fontSize: 18, fontWeight: FontWeight.w700,letterSpacing: 0.2,),
                         CustomText(text:"${balenceHistory["available_balance"]}", fontSize: 19, fontWeight: FontWeight.w800,letterSpacing: 0.2,)
                       ],),
                     ),
                   ],
                 ),
                ),
              SizedBox(height: 10,),
              // Container(
              //   margin: EdgeInsets.only(left: 15,right: 15),
              //   height: 55,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     border: Border.all(
              //       width: 1,color: Colors.black54
              //     )
              //   ),
              //   child: Row(
              //     children: [
              //       Container(
              //         margin: EdgeInsets.only(left: 15,right: 15),
              //         height: 20,
              //         width: 20,
              //         child: Image.asset("assets/task 1.png"),
              //       ),
              //       Expanded(
              //         child: Container(
              //           height: 50,
              //           width: MediaQuery.of(context).size.width*0.8,
              //           //  padding: EdgeInsets.only(left: 15, right: 15),
              //           decoration: BoxDecoration(
              //               borderRadius: BorderRadius.circular(11),
              //               border: Border.all(color:Colors.white,width: 2),
              //               color: Colors.white
              //           ),
              //           child: IgnorePointer(
              //             ignoring: false,
              //             child: DropdownButton(
              //               enableFeedback: true,
              //               autofocus: false,
              //               isExpanded: true,
              //               hint: InkWell(
              //                   onTap: () {}, child: Text('Select UpZila')),
              //               // Not necessary for Option 1
              //               value: paymentMethod,
              //               onChanged: (newValue) {
              //                 setState(() {
              //                   paymentMethod = newValue.toString();
              //                 });
              //               },
              //               items:paymentMethodList.map((location) {
              //                 return DropdownMenuItem(
              //                   child: Container(
              //                     width: double.infinity,
              //                     padding: const EdgeInsets.all(8.0),
              //                     child: Text("${location}"),
              //                   ),
              //                   value: "${location}",
              //                 );
              //               }).toList(),
              //             ),
              //           ),
              //         ),
              //       ),
              //
              //     ],
              //   ),
              // ),
              // SizedBox(height: 10,),
              // is_payment_button_clicked?Container(
              //   margin: EdgeInsets.only(
              //     top: 20,left: 15,right: 15
              //   ),
              //   padding: EdgeInsets.all(15),
              //   height: 87,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     borderRadius: BorderRadius.circular(15),
              //     color: Color(0xffFEEDED)
              //   ),
              //   child: Column(
              //     mainAxisAlignment: MainAxisAlignment.center,
              //     children: [
              //       CustomText(text: "Payment Request has been submitted", fontSize: 19, fontWeight: FontWeight.w900,letterSpacing: 0.2,color: customredcolor,),
              //       CustomText(text: "Successfully!", fontSize: 19, fontWeight: FontWeight.w900,letterSpacing: 0.2, color: customredcolor,),
              //
              //     ],
              //   )
              // )  :
              // Padding(
              //   padding: const EdgeInsets.only(left: 15.0,right: 15,top: 15),
              //   child: CustomButton(onTap: () {
              //       setState(() {
              //         is_payment_button_clicked=!is_payment_button_clicked;
              //       });
              //   }, text: "Payment Request", button_text_fontSize: 19, button_height: 55),
              // )
            ],
          ),
        ),
      ),
    );

  }

}
