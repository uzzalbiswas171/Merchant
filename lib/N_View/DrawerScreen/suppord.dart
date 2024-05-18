import 'package:e_currier/N_CustomWidget/CustomText/custom_text.dart';
import 'package:flutter/material.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  @override
  Widget build(BuildContext context) {
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
            title: Center(child: CustomText(text: "Support", fontSize: 25, fontWeight: FontWeight.w800,letterSpacing: 0.2,))),
      ),
      ///Search bar
      Divider(height: 3,color: Colors.grey.withOpacity(0.5),),
              Expanded(child: Container(
                height: 600,
                width: double.infinity,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                   //   CustomText(text: "Ocado Customer", fontSize: 20, fontWeight: FontWeight.w700),
                      CustomText(text: "Ecommerce Customer", fontSize: 20, fontWeight: FontWeight.w700),
                      CustomText(text: "Care", fontSize: 20, fontWeight: FontWeight.w700),
                      Container(
                          height: 30,
                          margin: EdgeInsets.all(20),
                          child: CustomText(text: "+8801332552444", fontSize: 25, fontWeight: FontWeight.w700)),
                      CustomText(text: "support@ocadocourier.com", fontSize: 25, fontWeight: FontWeight.w700),
                      SizedBox(height: 20,),
                      Container(
                        height: 85,
                        width: 91,
                        padding: EdgeInsets.all(5),
                        decoration: BoxDecoration(
                            color: Color(0xe8eab8b8),
                            borderRadius: BorderRadius.circular(15)),
                        child: Image(image: AssetImage("assets/call-center 1.png"),height: 50,width: 50,),
                      ),
                      SizedBox(height: 20,),
                      CustomText(text: "24/7 For Any Issue", fontSize: 25, fontWeight: FontWeight.w700)
                      ,SizedBox(
                        height: MediaQuery.of(context).size.height*0.1,
                      ),
                    ],
                  ),
                ),
              ))

    ]
    )
      )
    );
  }
}
