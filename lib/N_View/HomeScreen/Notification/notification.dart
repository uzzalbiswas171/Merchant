import 'package:e_currier/constant.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../../N_Statemanagement/e_currier_provider.dart';

class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  State<NotificationScreen> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  @override
  void initState() {
    Provider.of<E_Currier_Provierd>(context,listen: false).getnoticeRequesttProvider(context);
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    dynamic notice=Provider.of<E_Currier_Provierd>(context).notice;
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        child:"${notice}"=="null"?Center(child: CircularProgressIndicator(),): ListView.builder(
          itemCount: notice.length,
          scrollDirection: Axis.vertical,
          itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.only(
              bottom: 15,
              left: 15,
              right: 15,
            ),
            padding: EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(11),
              color: redColor
            ),
            child: Row(
              children: [
             CircleAvatar(
               radius: 25,
               child: CircleAvatar(
                 radius: 20,
                child: Image.asset("${custom_image}",fit: BoxFit.fill,),
                 //  child: Image.asset("assets/Drawerimage/e_courier.png",fit: BoxFit.fill,),
               ),
             ),
                SizedBox(
                  width: 15,

                ),
                Expanded(
                  child: Text("${notice[index]["notice"]}",style: GoogleFonts.poppins(
                    fontSize: 17,
                    letterSpacing: 0.20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white
                   ),
                  ),
                ),
              ],
            ),
          );
        },),
      ),
    );
  }
}
