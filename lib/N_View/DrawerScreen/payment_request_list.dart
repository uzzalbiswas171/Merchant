import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_View/Invoice/invoice.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

import '../../N_Statemanagement/e_currier_provider.dart';

class PaymentRequestListScreen extends StatefulWidget {
   PaymentRequestListScreen({super.key,required this.selected_index});
  int selected_index;
  @override
  State<PaymentRequestListScreen> createState() => _PaymentRequestListScreenState();
}

class _PaymentRequestListScreenState extends State<PaymentRequestListScreen> {

  TextEditingController _searchController=TextEditingController();
  int? selected_index;
  List listA=[];
  @override
  void initState() {
    selected_index=widget.selected_index;
    Provider.of<E_Currier_Provierd>(context,listen: false).getgetpayment_requestProvider(context);
   // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
     var getpaymentRequestListist=Provider.of<E_Currier_Provierd>(context).getpaymentRequestListist;

    return RefreshIndicator(
      onRefresh: () {
        return Future(() {
          Provider.of<E_Currier_Provierd>(context,listen: false).getgetpayment_requestProvider(context);
        });
      },
      child: Scaffold(
        body: Container(
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
                    title: Center(child: CustomText(text:selected_index==0? "Payment Request List" : "Payment History", fontSize: 25, fontWeight: FontWeight.w800,letterSpacing: 0.2,))),
              ),
              ///Search bar
              Divider(height: 3,color: Colors.grey.withOpacity(0.5),),
              ///Total returns
              Container(
                margin: EdgeInsets.only(left: 15,right: 15,top: 15),
                height: 28,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CustomText(text: "Total", fontSize: 20, fontWeight: FontWeight.w700,letterSpacing: 0.2,),
                    CustomText(text:selected_index==0? "${getpaymentRequestListist.length??"0"} Requests": "${listA.length} Requests", fontSize: 18, fontWeight: FontWeight.w400,letterSpacing: 0.2,color: Color(0xff404042),)
                  ],
                ),
              ),
              /// List History Part
              // selected_index==0?
              // Expanded(
              //   child: GridView.builder(
              //     shrinkWrap: true,
              //     itemCount: total_order_history.length,
              //     scrollDirection: Axis.vertical,
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 1,
              //         mainAxisSpacing: 16,
              //         mainAxisExtent: 97),
              //     itemBuilder: (context, index) {
              //       print(total_order_history.length);
              //       return  Container(
              //           height: 153,
              //           width: double.infinity,
              //           margin: EdgeInsets.only(
              //             left: 15,right: 15,
              //           ),
              //           padding: EdgeInsets.only(
              //               left: 0,right: 15,top: 12
              //           ),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(11),
              //             border: Border.all(width: 1,color: Colors.black12),
              //           ),
              //           child:Column(
              //             children: [
              //               Container(
              //                 height: 30,
              //                 width: double.infinity,
              //                 child: Row(
              //                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //                   children: [
              //                     Container(
              //                         width:selected_index==2 || selected_index==3?105: 183,
              //                         height: 30,
              //                         alignment: Alignment.center,
              //                         decoration: BoxDecoration(
              //                             borderRadius: BorderRadius.only(
              //                               topRight: Radius.circular(11),
              //                               bottomRight: Radius.circular(11),
              //                             ),
              //                             color:selected_index==1?Color(0xffCFCA58) :selected_index==2?Color(0xff5ACF58):selected_index==3 ?Color(0xff8A9CC9):Color(0xff58CFC8)
              //                         ),
              //                         child:
              //                         selected_index==1? CustomText(text: "Pick Up Request" , fontSize: 18, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
              //                             :
              //                         selected_index==2? CustomText(text: "Delivered"  , fontSize: 18, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
              //                             :
              //                         selected_index==3? CustomText(text: "Return" , fontSize: 18, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
              //                             :
              //                         CustomText(text:total_order_history[index]["status"]==0?"Active":total_order_history[index]["status"]==1?"Cancel":total_order_history[index]["status"]==2?"Sent To Agent":total_order_history[index]["status"]==3?"Send to Hub":total_order_history[index]["status"]==4?"Sent To Receiver":total_order_history[index]["status"]==5?"Receive By Receiver":total_order_history[index]["status"]==6?"Send to Delivery man":total_order_history[index]["status"]==7?"Deliver":total_order_history[index]["status"]==8?"Not Delivered":total_order_history[index]["status"]==9?"Return":total_order_history[index]["status"]==10?"Received by Agent":total_order_history[index]["status"]==11?"Pending":total_order_history[index]["status"]==12?"Re-With-Del-Charge":total_order_history[index]["status"]==13?"ReSchedule":total_order_history[index]["status"]==14?"Hold On":total_order_history[index]["status"]==15?"In Transit":"Nothing", fontSize: 18, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
              //
              //                     ),
              //                     selected_index==2?   Container(
              //                       margin: EdgeInsets.only(left: 10),
              //                       height: 30,
              //                       width: 66,
              //                       decoration: BoxDecoration(
              //                           borderRadius: BorderRadius.circular(25),
              //                           border: Border.all(
              //                               width: 1,
              //                               color: Colors.grey.withOpacity(0.5)
              //                           )
              //                       ),
              //                       alignment: Alignment.center,
              //                       child: CustomText(text: "Paid", fontSize: 17, fontWeight: FontWeight.w500),
              //                     ):Container(),
              //                     Expanded(
              //                         child: Align(
              //                             alignment: Alignment.centerRight,
              //                             child: CustomText(text: "Date: ${total_order_history[index]["date"]}", fontSize: 17, fontWeight: FontWeight.w500,letterSpacing: 0.2,)))
              //                   ],
              //                 ),
              //               ),
              //               SizedBox(height: 5),
              //               Expanded(
              //                 child: Container(
              //                   child: Row(
              //                     children: [
              //                       Expanded(
              //                           flex: 4,
              //                           child: Padding(
              //                             padding: const EdgeInsets.only(left: 5.0),
              //                             child: Column(
              //                               mainAxisAlignment: MainAxisAlignment.start,
              //                               crossAxisAlignment: CrossAxisAlignment.start,
              //                               children: [
              //                                 Container(
              //                                   height: 20,
              //                                   child: Row(
              //                                     crossAxisAlignment: CrossAxisAlignment.start,
              //                                     mainAxisAlignment: MainAxisAlignment.start,
              //                                     children: [
              //                                       Padding(
              //                                         padding: EdgeInsets.only(top:5),
              //                                         child: Row(
              //                                           children: [
              //                                             CustomText(text: "Merchant:", fontSize: 14, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
              //                                             CustomText(text: "Merchant:", fontSize: 13, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
              //                                           ],
              //                                         ),
              //                                       )
              //                                     ],
              //                                   ),
              //                                 ),
              //                                 Container(
              //                                   margin: EdgeInsets.only(
              //                                     top: 5
              //                                   ),
              //                                     alignment: Alignment.centerLeft,
              //                                     height: 20,
              //                                     child: CustomText(text: "Withdrawal Amount", fontSize: 14, fontWeight: FontWeight.w400,letterSpacing: 0.2,)),
              //
              //                               ],
              //                             ),
              //                           )),
              //                       Expanded(
              //                           flex: 3,
              //                           child: Column(
              //                             mainAxisAlignment: MainAxisAlignment.start,
              //                             crossAxisAlignment: CrossAxisAlignment.end,
              //                             children: [
              //                               Container(
              //                                   height: 21,
              //                                   child: Row(
              //                                     mainAxisAlignment: MainAxisAlignment.end,
              //                                     children: [
              //                                       Image(image:AssetImage("assets/receipt 2.png"),height: 13,width: 13,fit: BoxFit.fill,),
              //                                       SizedBox(width: 5,),
              //                                       CustomText(text: "Inv no:", fontSize: 15, fontWeight: FontWeight.w500),
              //                                       CustomText(text: "#OC8400", fontSize: 12, fontWeight: FontWeight.w300),
              //                                     ],
              //                                   )),
              //                               Container(
              //                                   height: 25,
              //                                   child: Row(
              //                                     mainAxisAlignment: MainAxisAlignment.end,
              //                                     children: [
              //                                       CustomText(text: "", fontSize: 18, fontWeight: FontWeight.w500,color: customredcolor,),
              //                                       CustomText(text: "৳${total_order_history[index]["cash"]}", fontSize: 18, fontWeight: FontWeight.w500)
              //                                     ],
              //                                   )),
              //                             ],
              //                           ))
              //                     ],
              //                   ),
              //                 ),
              //               )
              //             ],
              //           )
              //       );
              //     },
              //   ),
              // )
              //     :
              Expanded(
                child: GridView.builder(
                  shrinkWrap: true,
                  itemCount: getpaymentRequestListist.length,
                  scrollDirection: Axis.vertical,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 16,
                      mainAxisExtent: 97),
                  itemBuilder: (context, index) {
                    return  InkWell(
                      onTap: () {
Navigator.push(context, MaterialPageRoute(builder: (context) => InvoiceScreen(map: getpaymentRequestListist[index]),));
                      },
                      child: Container(
                          height: 153,
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            left: 15,right: 15,
                          ),
                          padding: EdgeInsets.only(
                              left: 0,right: 15,top: 12
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(11),
                            border: Border.all(width: 1,color: Colors.black12),
                          ),
                          child:Column(
                            children: [
                              Container(
                                width: double.infinity,
                                padding: EdgeInsets.only(left: 5),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [

                                        Expanded(
                                            flex: 3,
                                            child: CustomText(text :"Merchant Name : ${getpaymentRequestListist[index]["parcel"]["customer_name"]}", fontSize: 15, fontWeight: FontWeight.w600,letterSpacing: 0.2,)),

                                    Expanded(
                                        flex: 2,
                                        child: Align(
                                            alignment: Alignment.centerRight,
                                            child: CustomText(text: "Date: ${getpaymentRequestListist[index]["parcel"]["date"]}", fontSize: 14, fontWeight: FontWeight.w500,letterSpacing: 0.2,)))
                                  ],
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  child: Row(
                                    children: [
                                      Expanded(
                                          flex: 4,
                                          child: Padding(
                                            padding: const EdgeInsets.only(left: 5.0),
                                            child: Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5
                                                    ),
                                                    alignment: Alignment.centerLeft,
                                                    height: 20,
                                                    child: CustomText(text: "Parcel Id : ${getpaymentRequestListist[index]["parcel_id"]}", fontSize: 17, fontWeight: FontWeight.w600,letterSpacing: 0.2,)),

                                                Container(
                                                    margin: EdgeInsets.only(
                                                        top: 5
                                                    ),
                                                    alignment: Alignment.centerLeft,
                                                    height: 20,
                                                    child: CustomText(text: "Cash Amount ", fontSize: 17, fontWeight: FontWeight.w600,letterSpacing: 0.2,)),

                                              ],
                                            ),
                                          )),
                                      Expanded(
                                          flex: 3,
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                  height: 21,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      Image(image:AssetImage("assets/receipt 2.png"),height: 13,width: 13,fit: BoxFit.fill,),
                                                      SizedBox(width: 5,height: 5,),
                                                      CustomText(text: "Inv no:", fontSize: 15, fontWeight: FontWeight.w500),
                                                      CustomText(text: "#OC${getpaymentRequestListist[index]["parcel_id"]}", fontSize: 12, fontWeight: FontWeight.w300),
                                                    ],
                                                  )),
                                              Container(
                                                margin: EdgeInsets.only(top: 5),
                                                  height: 25,
                                                  child: Row(
                                                    mainAxisAlignment: MainAxisAlignment.end,
                                                    children: [
                                                      CustomText(text: "৳", fontSize: 20, fontWeight: FontWeight.w500,color: customredcolor,),
                                                      CustomText(text: "${getpaymentRequestListist[index]["amount"]}", fontSize: 18, fontWeight: FontWeight.w500)
                                                    ],
                                                  )),
                                            ],
                                          ))
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )
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
