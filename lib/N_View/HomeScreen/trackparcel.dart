import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_Statemanagement/e_currier_provider.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TrackParcelScreen extends StatefulWidget {
  TrackParcelScreen({super.key,required this.parcel_id});
  String parcel_id;
  @override
  State<TrackParcelScreen> createState() => _TrackParcelScreenState();
}

class _TrackParcelScreenState extends State<TrackParcelScreen> {
  @override
  void initState() {
     Provider.of<E_Currier_Provierd>(context,listen: false).parceltracklistProvider(context, "OC-2024${widget.parcel_id}");
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final parceltracklist=Provider.of<E_Currier_Provierd>(context).parceltracklist;
   print("ssssssssssssssssssssssssssssssssssssssssssssssssssssssss ${parceltracklist}");
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: CustomText(text: "Your Track Parcel ID : ${widget.parcel_id}", fontSize: 16, fontWeight: FontWeight.bold),
      ),
      body: RefreshIndicator(
        onRefresh: () {
          return Future.delayed(Duration(seconds: 1),() {
            Provider.of<E_Currier_Provierd>(context,listen: false).parceltracklistProvider(context, "${widget.parcel_id}");
          },);
        },
        child:"${parceltracklist}"=="null"?Center(child: CircularProgressIndicator(),):
        "$parceltracklist"=="[]"?Center(
          child: CustomText(text: "YOUR PARCEL IS NOT SEND", fontSize: 20, fontWeight: FontWeight.bold),
        ):
        Container(
          height: double.infinity,
          width: double.infinity,
          padding: EdgeInsets.all(15),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Container(
                  color: Colors.white,
                  child: Table(
                    border: TableBorder.all(color: Colors.black),
                    children: [
                      TableRow(children: [
                        Center(child: Text('Merchant')),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('${parceltracklist[0]["parcel"]["merchant"]["name"]}'),
                        ),

                        Center(child: Text('User')),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('${parceltracklist[0]["parcel"]["customer_name"]}'),
                        ),
                      ]),

                      TableRow(children: [
                        Center(child: Text('Phone')),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('${parceltracklist[0]["parcel"]["merchant"]["phone"]}'),
                        ),
                        Center(child: Text('Phone')),
                        Padding(
                          padding: const EdgeInsets.all(3.0),
                          child: Text('${parceltracklist[0]["parcel"]["customer_phone"]}'),
                        ),
                      ]),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Expanded(
                child: ListView.builder(
                  itemCount: parceltracklist.length,
                  itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    child: Row(
                      children: [
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child:  Text(  "${parceltracklist[index]["created_at"]}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 13
                                      , fontWeight: FontWeight.bold
                                  ),
                                 ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: Column(children: [
                        Expanded(child:index==0 && parceltracklist[index]["status"]==7?
                        CircleAvatar(radius: 20,backgroundColor: Colors.white,backgroundImage: AssetImage("assets/deliverddone.png"),)
                        : index==0 && parceltracklist[index]["status"]!=7
                            ?
                          CircleAvatar(radius: 20,backgroundColor: Colors.white,backgroundImage: AssetImage("assets/arrowup.png"),)
                            :
                            CircleAvatar(radius: 20,backgroundColor: defaultBackgroundColor,backgroundImage: AssetImage("assets/okk.png")),),
                        Expanded(
                            child:parceltracklist.length-1==index?Container():
                        Container(height: 50,width: 5,color: Colors.black,))
                        ],)),

                        Expanded(
                          flex: 2,
                            child: Container(
                              padding: const EdgeInsets.only(bottom: 50.0),
                              alignment: Alignment.centerLeft,
                              child:  Text(
                              parceltracklist[index]["status"]==0?"Active":parceltracklist[index]["status"]==1?"Cancel":parceltracklist[index]["status"]==2?"Assigned To Agent":parceltracklist[index]["status"]==3?"Transit":parceltracklist[index]["status"]==4?"Assigned To Receiver":parceltracklist[index]["status"]==5?"Received By Receiver":parceltracklist[index]["status"]==6?"Assign to DeliveryMan":parceltracklist[index]["status"]==7?"DELIVERED SUCCESSFULLY":parceltracklist[index]["status"]==8?"Not Delivered":parceltracklist[index]["status"]==9?"Return":parceltracklist[index]["status"]==10?"Received by Agent":parceltracklist[index]["status"]==11?"Pending":parceltracklist[index]["status"]==12?"Re-With-Del-Charge":parceltracklist[index]["status"]==13?"ReSchedule":parceltracklist[index]["status"]==14?"Hold On":parceltracklist[index]["status"]==15?"In Transit":parceltracklist[index]["status"]==16?"Received by DeliveryMan":"status 17",
                               style: GoogleFonts.poppins(
                                 fontSize: 16, fontWeight: FontWeight.w700,letterSpacing: 0.2,
                               ),
                              ),

                          // child: Column(
                          //   crossAxisAlignment: CrossAxisAlignment.start,
                          //   mainAxisAlignment: MainAxisAlignment.start,
                          //   children: [
                          //
                          //   //   "${parceltracklist[index]["sender"]}"=="null"?Container() : CustomText(text: "1. Send By ${parceltracklist[index]["sender"]["name"]??""}", fontSize: 14, fontWeight: FontWeight.w600,),
                          //   // "${parceltracklist[index]["receiver"]}"=="null"?Container() :CustomText(text: "2. Received By ${parceltracklist[index]["receiver"]["name"]??""}", fontSize: 14, fontWeight: FontWeight.w600,)
                          //   // ,"${parceltracklist[index]["hub"]}"=="null"?Container() :CustomText(text: "3. In hub ${parceltracklist[index]["hub"]["name"]}", fontSize: 14, fontWeight: FontWeight.w600,)
                          //   //
                          //   ],
                          // ),
                        ),
                       )
                      ],
                    ),
                  );
                },),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
