




import 'dart:convert';

import 'package:e_currier/N_View/Auth/Login/screens/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart';
import 'package:http/http.dart' as http;

import '../constant.dart';

class CustomHttp{
  Map<String, String> headers= <String,String>{
    "accept": "application/json",
    'Authorization': 'Bearer ${GetStorage().read("Api_token")}'
  };
  ///Get Profile
  bool is_getprofile=false;
  getProfile(BuildContext context)async{
    String url="${BaseUrl}/api/auth/merchant_profile";
    try{
      Response response=await http.get(Uri.parse(url),headers: CustomHttp().headers);

      var decodedata=jsonDecode(response.body);
      if(response.statusCode==200){
        GetStorage().write("GetProfile", decodedata);
        is_getprofile=true;
      }else{
        GetStorage().erase();
      //  Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen(),));
      }
    }catch(e){
      GetStorage().erase();
      print("Peg profile catch error $e");
    }
      return is_getprofile;
  }
  /// ------------Division list ---------------///
  List divisionList=[];
  getDivisionHttpRequest(
      String api_end_point,
      BuildContext context,
      bool is_api_get,
      )async{
    print("divisionnnnnnnnnnnnnnnnnnnnnnnnnnnn");
    try{
      var response = await http.get(Uri.parse("${BaseUrl}/api/division"));
      var data = jsonDecode(response.body);
      divisionList = data;
    }catch(e){
      print("Division  Http Request Catch Error ======= ${e}");
    }
    return divisionList;
  }
  /// ------------District list ---------------///
  List districtList=[];
  getDistrictHttpRequest(
      String api_end_point,
      BuildContext context,
      bool is_api_get,
      )async{
    try{
      var response = await http.get(Uri.parse("${BaseUrl}${api_end_point}"));
      var data =  jsonDecode(response.body);
      districtList = data;
    }catch(e){
      print("District  Http Request Catch Error ======= ${e}");
    }
    return districtList;
  }


  /// ------------Thana list ---------------///
  List thanaList=[];
  getthanaHttpRequest(
      String api_end_point,
      BuildContext context,
      bool is_api_get,
      )async{

    try{
      var response = await http.get(Uri.parse("${BaseUrl}${api_end_point}"));
      var data =  jsonDecode(response.body);
      thanaList = data;
    }catch(e){
      print("District  Http Request Catch Error ======= ${e}");
    }
    return thanaList;
  }

  /// ------------Ledger ---------------///
  List userledger=[];
  userledgerHttpRequest(
      String api_end_point,
      BuildContext context,
      bool is_api_get,
      )async{

    try{
      var response = await http.get(Uri.parse("${api_end_point}"),headers: headers);
      var data =  jsonDecode(response.body);
      userledger = data;
    }catch(e){
      print("Uuserledger  Catch Error ======= ${e}");
    }
    return userledger;

  }

  /// ------------Pickup Area ---------------///
  List PickupArea=[];
  getPickupAreaHttpRequest(
      BuildContext context,
      )async{
    try{
      var response = await http.get(Uri.parse("${BaseUrl}/api/pickuparea"));
      print("cccccccccccccc ${response.body}");

      var data =  jsonDecode(response.body);
      PickupArea = data;
    }catch(e){
      print("District  Http Request Catch Error ======= ${e}");
    }
    return PickupArea;
  }

  /// ------------Plan list---------------///
  List plan_list=[];
  getplan_listHttpRequest(
      BuildContext context,
      )async{
    try{
      var response = await http.get(Uri.parse("${BaseUrl}/api/plan"));
      var data =  jsonDecode(response.body);
      plan_list = data;
    }catch(e){
      print("/api/plan Http Request Catch Error ======= ${e}");
    }
    return plan_list;
  }

  /// ------------  bcategory list--------------///
  List category_list=[];
  getCtegoryHttpRequest(
      BuildContext context,
      )async{

    try{
      var response = await http.get(Uri.parse("${BaseUrl}/api/auth/category"),headers: headers);
      var data =  jsonDecode(response.body);
      category_list = data;
    }catch(e){
      print("category_list Http Request Catch Error ======= ${e}");
    }
    return category_list;
  }

/// ------------  Total order history list--------------///
List getTotalOrderList=[];
getTotalOrder(BuildContext context)async{
    String link="${BaseUrl}/api/auth/parcel_list";
    try{
      Response response=await http.get(Uri.parse(link),headers: headers);
      getTotalOrderList=jsonDecode(response.body);

    }catch(e){
      print("Catch error is ============ > $e");
    }
    return getTotalOrderList;
}
/// ------------  Total payment history list--------------///
List paymentHistorolist=[];
getTotalpaymenthistory(BuildContext context)async{
    String link="${BaseUrl}/api/auth/payment_history";
    try{
      Response response=await http.get(Uri.parse(link),headers: headers);
      paymentHistorolist=jsonDecode(response.body);
    }catch(e){
      print("Catch error is /api/auth/payment_history============ > $e");
    }
    return paymentHistorolist;
}


/// ------------  Total payment request list--------------///
List payment_requestlist=[];
getpayment_request(BuildContext context)async{
    String link="${BaseUrl}/api/auth/payment_history";
    try{
      Response response=await http.get(Uri.parse(link),headers: headers);
      payment_requestlist=jsonDecode(response.body);
    }catch(e){
      print("Catch error is payment_requestlist =========== > $e");
    }
    return payment_requestlist;
}


/// ------------  Date wise search--------------///
dynamic datewiselist ;
getdatewiselist(BuildContext context,String fromdate,String todate)async{
    String link="${BaseUrl}/api/auth/date_wise_search?form_date=$fromdate&to_date=$todate";
    try{
      Response response=await http.get(Uri.parse(link),headers: headers);
      datewiselist=jsonDecode(response.body);
    }catch(e){
      print("Catch error is datewiselist============ > $e");
    }
    return datewiselist;
}

  ///Get All notice
  dynamic getnotice=[];
  getnoticeRequestt(BuildContext context)async{
    String url="${BaseUrl}/api/notice";
    try{
      Response response=await http.get(Uri.parse(url),headers:headers);
      getnotice=jsonDecode(response.body);
    }catch(e){
      print("getnotice $e");
    }
    return getnotice;
  }

/// ------------  Parcel track list--------------///
dynamic parceltracklist ;
  parceltracklistfunction(BuildContext context,String parcel_id)async{
 String link="${BaseUrl}/api/traceparcel?request_trace_id=${parcel_id}";
    //   String link="${BaseUrl}/api/traceparcel?request_trace_id=OC-20246";
    try{
      Response response=await http.get(Uri.parse(link),headers: headers);
      print("xxxxxxxxxxxxxxxxxx ${response.body}");
      parceltracklist=jsonDecode(response.body);
    }catch(e){
      print("Catch error is parceltracklist============ > $e");
    }
    return parceltracklist;
 }


/// ------------ balaccehistory--------------///
dynamic balenceHistory ;
  balenceHistoryfunction(BuildContext context,)async{
 String link="${BaseUrl}/api/auth/balaccehistory";
    try{
      Response response=await http.get(Uri.parse(link),headers: headers);
      balenceHistory=jsonDecode(response.body);
    }catch(e){
      print("Catch error is balenceHistory============ > $e");
    }
    return balenceHistory;
 }
}