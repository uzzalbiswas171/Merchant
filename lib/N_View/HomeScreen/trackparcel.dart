import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:e_currier/N_Statemanagement/e_currier_provider.dart';
import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
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
     Provider.of<E_Currier_Provierd>(context,listen: false).parceltracklistProvider(context, "${widget.parcel_id}");
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
          child: CustomText(text: "Not found Your Parcel Id", fontSize: 20, fontWeight: FontWeight.bold),
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
                        Expanded(flex: 1,
                          child: Align(
                            alignment: Alignment.topCenter,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: CustomText(text: "${parceltracklist[index]["created_at"]}", fontSize: 13
                                  , fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Expanded(child: Column(children: [
                        Expanded(child:parceltracklist.length-1==index?CircleAvatar(radius: 20,backgroundColor: defaultBackgroundColor,backgroundImage: AssetImage("assets/clickright.png")):
                            CircleAvatar(radius: 20,backgroundColor: defaultBackgroundColor,backgroundImage: AssetImage("assets/okk.png")),),
                        Expanded(
                            child:parceltracklist.length-1==index?Container():
                        Container(height: 50,width: 5,color: Colors.black,))
                        ],)),

                        Expanded(
                          flex: 2,
                            child: Padding(
                              padding: const EdgeInsets.only(bottom: 15.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                            CustomText(text: "1. Send By ${parceltracklist[index]["sender"]["name"]??""}", fontSize: 14, fontWeight: FontWeight.w600,),
                            "${parceltracklist[index]["receiver"]}"=="null"?Container() :CustomText(text: "2. Received By ${parceltracklist[index]["receiver"]["name"]??""}", fontSize: 14, fontWeight: FontWeight.w600,)
                            ,"${parceltracklist[index]["hub"]}"=="null"?Container() :CustomText(text: "3. In hub ${parceltracklist[index]["hub"]["name"]}", fontSize: 14, fontWeight: FontWeight.w600,)
                                        ],),
                        ))
                
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
