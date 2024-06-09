import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_CustomWidget/custom_text_formfield.dart';
import 'package:e_currier/N_Statemanagement/e_currier_provider.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart' as UrlLauncher;
import 'package:url_launcher/url_launcher.dart';

class DrawerHistoryScreen extends StatefulWidget {
  const DrawerHistoryScreen({super.key});

  @override
  State<DrawerHistoryScreen> createState() => _DrawerHistoryScreenState();
}

class _DrawerHistoryScreenState extends State<DrawerHistoryScreen> {
  List statuslist=[
    "Total",
    "Active",
    "Delivered",
    "Returned",
  ];
  List listA=[];
  List searchlist=[]; 
  TextEditingController _searchController=TextEditingController();
  int selected_index=0;
  var total_order_history;
  @override
  void initState() {
   // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    if(is_true==false){
      total_order_history=Provider.of<E_Currier_Provierd>(context).getTotalOrderList;
    }else{
     return total_order_history;
    }

   print("aaaaaaaaaaaaaaaaaaaaaaaaa ============= ${total_order_history}");
    return Scaffold(
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

                  title: Center(child: CustomText(text: "Order History", fontSize: 25, fontWeight: FontWeight.w700,letterSpacing: 0.2,))),
            ),
            Container(
              margin: EdgeInsets.only(
                bottom: 15
              ),
              height: 50,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(6),
                border: Border.all(
                  color: Colors.grey.withOpacity(0.54)
                )
              ),
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: statuslist.length,
                itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    setState(() { 
                     index==1? listA=total_order_history.where((e) => e["status"]==0).toList()
                     :
                     index==2? listA=total_order_history.where((e) => e["status"]==7).toList()
                     :
                     index==3? listA=total_order_history.where((e) => e["status"]==9).toList()
                         :
                         total_order_history;

                      print("new list after ${listA.length}");


                      selected_index=index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    width: 100,
                    decoration: BoxDecoration(
                      border: Border(
                        bottom: BorderSide(width: 3, color:selected_index==index? customredcolor:customredcolor.withOpacity(0.0),style: BorderStyle.solid),
                      ),
                    ),
                    alignment: Alignment.center,
                    child: CustomText(text: "${statuslist[index]}", fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,),
                  ),
                );
              },),
            ),
            ///Search bar
            selected_index==0?   Container(
              margin: EdgeInsets.only(
                top: 10,
                bottom: 20
              ),
              padding: const EdgeInsets.only(left: 15,right: 15),
              child:  Container(
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(11),
                  border: Border.all(
                    width: 1
                  )
                ),
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  obscureText: false,
                  onChanged: (value) {

                    setState(() {
                      print("zzzzzzzzzzzzzzzzz ${searchlist.toString()}");
                 
                     searchlist=total_order_history.where((element) {

                    return element["customer_name"].toString()==value.toString() || element["customer_phone"]==value.toString();

                     }).toList();
                   });
                  },
                  controller: _searchController,
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.only(top: 8),
                      border: InputBorder.none,
                     hintText: "Recipient Name/Phone",
                      prefixIcon: Icon(Icons.search)
                    ),
                   ),
              ),
            ):Container(),
            Divider(height: 3,color: Colors.grey.withOpacity(0.5),),
            ///Total returns
            Container(
              margin: EdgeInsets.only(left: 15,right: 15,top: 15),
             height: 28,
             width: double.infinity,
             child: Row(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               children: [
                 CustomText(text: "Total", fontSize: 16, fontWeight: FontWeight.w700,letterSpacing: 0.2,),
                 CustomText(text:selected_index==0? "${total_order_history.length??"0"} Orders": "${listA.length} Orders", fontSize: 16, fontWeight: FontWeight.w400,letterSpacing: 0.2,color: Color(0xff404042),)
               ],
             ),
            ),
            /// List History Part
            selected_index==0?
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount:"${searchlist.toString()}"!="[]"?searchlist.length: total_order_history.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 150),
                  itemBuilder: (context, index) {
                  return  Container(
                     // height: 160,
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
                        height: 30,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:selected_index==2 || selected_index==3 || selected_index==0?105: 183,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(11),
                                  bottomRight: Radius.circular(11),
                                ),
                                color:selected_index==1?Color(0xffCFCA58) :selected_index==2?Color(0xff5ACF58):selected_index==3 ?Color(0xff8A9CC9):Color(0xff58CFC8)
                              ),
                              child:
                              selected_index==1? CustomText(text: "Pick Up Request" , fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
                                  :
                              selected_index==2? CustomText(text: "Delivered"  , fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
                                  :
                              selected_index==3? CustomText(text: "Return" , fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
                                  :
                              "${searchlist.toString()}"!="[]"?

                              CustomText(text:searchlist[index]["status"]==0?"Active":searchlist[index]["status"]==1?"Cancel":searchlist[index]["status"]==2?"Sent To Agent":searchlist[index]["status"]==3?"Send to Hub":searchlist[index]["status"]==4?"Sent To Receiver":searchlist[index]["status"]==5?"Receive By Receiver":searchlist[index]["status"]==6?"Send DeliveryMan":searchlist[index]["status"]==7?"Delivered":searchlist[index]["status"]==8?"Not Delivered":searchlist[index]["status"]==9?"Return":searchlist[index]["status"]==10?"Received by Agent":searchlist[index]["status"]==11?"Pending":searchlist[index]["status"]==12?"Re-With-Del-Charge":searchlist[index]["status"]==13?"ReSchedule":searchlist[index]["status"]==14?"Hold On":searchlist[index]["status"]==15?"In Transit":searchlist[index]["status"]==16?"Received deliveryman":"status 17", fontSize: 14, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
                              :
                              CustomText(text:total_order_history[index]["status"]==0?"Active":total_order_history[index]["status"]==1?"Cancel":total_order_history[index]["status"]==2?"Sent To Agent":total_order_history[index]["status"]==3?"Send to Hub":total_order_history[index]["status"]==4?"Sent To Receiver":total_order_history[index]["status"]==5?"Receive By Receiver":total_order_history[index]["status"]==6?"Send DeliveryMan":total_order_history[index]["status"]==7?"Delivered":total_order_history[index]["status"]==8?"Not Delivered":total_order_history[index]["status"]==9?"Return":total_order_history[index]["status"]==10?"Received by Agent":total_order_history[index]["status"]==11?"Pending":total_order_history[index]["status"]==12?"Re-With-Del-Charge":total_order_history[index]["status"]==13?"ReSchedule":total_order_history[index]["status"]==14?"Hold On":total_order_history[index]["status"]==15?"In Transit":total_order_history[index]["status"]==16?"Received deliveryman":"status 17", fontSize: 14, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
                            ),
                            selected_index==2 ||  selected_index==0 ?   Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 30,
                              width: 66,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.5)
                                )
                              ),
                              alignment: Alignment.center,
                              child: CustomText(text:total_order_history[index]["status"]==7? "Paid" : "UnPaid", fontSize: 14, fontWeight: FontWeight.w500),
                            ):Container(),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: CustomText(text:"${searchlist.toString()}"!="[]"? "Date: ${searchlist[index]["date"]}": "Date: ${total_order_history[index]["date"]}", fontSize: 14, fontWeight: FontWeight.w500,letterSpacing: 0.2,)))
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
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
                                    CustomText(text:"${searchlist.toString()}"!="[]"? "${searchlist[index]["customer_name"]}": "${total_order_history[index]["customer_name"]}", fontSize: 15, fontWeight: FontWeight.w600,letterSpacing: 0.2,),
                                    Container(
                                      height: 28,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top:5),
                                            child: CustomText(text:"${searchlist.toString()}"!="[]"? "Order ID: OC-2024${searchlist[index]["id"]}": "Order ID: OC-2024${total_order_history[index]["id"]}", fontSize: 14, fontWeight: FontWeight.w300,letterSpacing: 0.2,),
                                          ),
                                          IconButton(onPressed: () {
                                            Clipboard.setData(new ClipboardData(text:"${searchlist.toString()}"!="[]"? "OC-2024${searchlist[index]["id"]}": "OC-2024${total_order_history[index]["id"]}"));
                                           ScaffoldMessenger.of(context).showSnackBar(
                                                new SnackBar(
                                                  duration: Duration(milliseconds: 50),
                                                  content: new Text("Copied to Clipboard"),));
                                          }, icon: Icon(Icons.copy,size: 14,color: Colors.grey,))
                                        ],
                                      ),
                                    ),
                                    CustomText(text:"${searchlist.toString()}"!="[]"?"Merchant ID: OC-${searchlist[index]["admin_id"]}": "Merchant ID: OC-${total_order_history[index]["admin_id"]}", fontSize: 14, fontWeight: FontWeight.w400,letterSpacing: 0.2,),

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
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Image(image:AssetImage("assets/Drawerimage/phone 3.png"),height: 20,width: 20,fit: BoxFit.fill,),
                                          CustomText(text:"${searchlist.toString()}"!="[]"?"${searchlist[index]["customer_phone"]}": "${total_order_history[index]["customer_phone"]}", fontSize: 14, fontWeight: FontWeight.w500),
                                        ],
                                      )),
                                  Container(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                             CustomText(text: "Total : ", fontSize: 14, fontWeight: FontWeight.w500,color: customredcolor,),
                                             CustomText(text:"${searchlist.toString()}"!="[]"?"৳${double.parse("${searchlist[index]["cash"]}").toStringAsFixed(0)}": "৳${double.parse("${total_order_history[index]["cash"]}").toStringAsFixed(0)}", fontSize: 14, fontWeight: FontWeight.w500)
                                        ],
                                      )),
                                  // Container(
                                  //     height: 25,
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.end,
                                  //       children: [
                                  //            CustomText(text: "Delivery C : ", fontSize: 13, fontWeight: FontWeight.w500,color: customredcolor,),
                                  //            CustomText(text:"${searchlist.toString()}"!="[]"? "৳${double.parse("${searchlist[index]["delivery_charge"]}").toStringAsFixed(0)}":  "৳${double.parse("${total_order_history[index]["delivery_charge"]}").toStringAsFixed(0)}", fontSize: 13, fontWeight: FontWeight.w500)
                                  //       ],
                                  //     )),

                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text( "Parcel Area : ${total_order_history[index]["parcel_area"]}"),
                          )),
                      SizedBox(height: 5,),

                    ],
                  )
                    );
                  },
              ),
            )
                :
            Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                itemCount: listA.length,
                scrollDirection: Axis.vertical,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                    mainAxisSpacing: 16,
                    mainAxisExtent: 150),
                  itemBuilder: (context, index) {
                  print(total_order_history.length);
                  return  Container(
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
                        height: 30,
                        width: double.infinity,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width:selected_index==2 || selected_index==3?105: 183,
                              height: 30,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.only(
                                  topRight: Radius.circular(11),
                                  bottomRight: Radius.circular(11),
                                ),
                                color:selected_index==1?Color(0xffCFCA58) :selected_index==2?Color(0xff5ACF58):selected_index==3 ?Color(0xff8A9CC9):Color(0xff58CFC8)
                              ),
                              child:
                              selected_index==1? CustomText(text: "Pick Up Request" , fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
                                  :
                              selected_index==2? CustomText(text: "Delivered"  , fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
                                  :
                              selected_index==3? CustomText(text: "Return" , fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,)
                                  :
                                CustomText(text:listA[index]["status"]==0?"Active":listA[index]["status"]==1?"Cancel":listA[index]["status"]==2?"Sent To Agent":listA[index]["status"]==3?"Send to Hub":listA[index]["status"]==4?"Sent To Receiver":listA[index]["status"]==5?"Receive By Receiver":listA[index]["status"]==6?"Send to Delivery man":listA[index]["status"]==7?"Deliver":listA[index]["status"]==8?"Not Delivered":listA[index]["status"]==9?"Return":listA[index]["status"]==10?"Received by Agent":listA[index]["status"]==11?"Pending":listA[index]["status"]==12?"Re-With-Del-Charge":listA[index]["status"]==13?"ReSchedule":listA[index]["status"]==14?"Hold On":listA[index]["status"]==15?"In Transit":"Received deliveryman", fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,)

                            ),
                            selected_index==2?   Container(
                              margin: EdgeInsets.only(left: 10),
                              height: 30,
                              width: 66,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(25),
                                border: Border.all(
                                  width: 1,
                                  color: Colors.grey.withOpacity(0.5)
                                )
                              ),
                              alignment: Alignment.center,
                              child: CustomText(text: "Paid", fontSize: 15, fontWeight: FontWeight.w500),
                            ):Container(),
                            Expanded(
                                child: Align(
                                    alignment: Alignment.centerRight,
                                    child: CustomText(text: "Date: ${listA[index]["date"]}", fontSize: 16, fontWeight: FontWeight.w500,letterSpacing: 0.2,)))
                          ],
                        ),
                      ),
                      SizedBox(height: 5),
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
                                    CustomText(text: "${listA[index]["customer_name"]}", fontSize: 17, fontWeight: FontWeight.w700,letterSpacing: 0.2,),
                                    Container(
                                      height: 28,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(top:5),
                                            child: CustomText(text: "Order ID: OC-2024${listA[index]["id"]}", fontSize: 14, fontWeight: FontWeight.w300,letterSpacing: 0.2,),
                                          ),
                                          IconButton(onPressed: () {
                                            Clipboard.setData(new ClipboardData(text: "OC-2024${listA[index]["id"]}"));
                                           ScaffoldMessenger.of(context).showSnackBar(
                                                new SnackBar(
                                                  duration: Duration(milliseconds: 50),
                                                  content: new Text("Copied to Clipboard"),));
                                          }, icon: Icon(Icons.copy,size: 16,color: Colors.grey,))
                                        ],
                                      ),
                                    ),
                                    CustomText(text: "Merchant ID: OC-${listA[index]["admin_id"]}", fontSize: 14, fontWeight: FontWeight.w400,letterSpacing: 0.2,),

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
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          Image(image:AssetImage("assets/Drawerimage/phone 3.png"),height: 20,width: 20,fit: BoxFit.fill,),
                                          CustomText(text: "${listA[index]["customer_phone"]}", fontSize: 14, fontWeight: FontWeight.w500),
                                        ],
                                      )),
                                  Container(
                                      height: 25,
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.end,
                                        children: [
                                          CustomText(text: "Total : ", fontSize: 14, fontWeight: FontWeight.w500,color: customredcolor,),
                                          CustomText(text: "৳${double.parse("${listA[index]["cash"]}").toStringAsFixed(0)}", fontSize: 16, fontWeight: FontWeight.w500)
                                        ],
                                      )),
                                  // Container(
                                  //     height: 25,
                                  //     child: Row(
                                  //       mainAxisAlignment: MainAxisAlignment.end,
                                  //       children: [
                                  //         CustomText(text: "Delivery C : ", fontSize: 13, fontWeight: FontWeight.w500,color: customredcolor,),
                                  //         CustomText(text: "৳${double.parse("${listA[index]["delivery_charge"]}").toStringAsFixed(0)}", fontSize: 13, fontWeight: FontWeight.w500)
                                  //       ],
                                  //     )),
                                ],
                              ))
                            ],
                          ),
                        ),
                      ),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Text( "Parcel Area : ${total_order_history[index]["parcel_area"] ??""}")),
                      SizedBox(height: 5,),
                    ],
                  )
                    );
                  },
              ),
            ),
          ],
        ),
      ),
    );
  }
  bool is_true=false;
  var total_order_historyr;
}
