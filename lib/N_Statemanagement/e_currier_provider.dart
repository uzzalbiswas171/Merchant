import 'package:flutter/cupertino.dart';

import '../N_Http/custom_http.dart';

class E_Currier_Provierd with ChangeNotifier{
  ///   Get Profile     ///
  late bool is_getProfile;
  getProfileProvider(
      BuildContext context,
      )async{
    is_getProfile= await CustomHttp().getProfile(context);
    notifyListeners();
  }
  ///    Division list      ///
  List divisionList=[];
  divisionProvider(
      String api_end_point,
      BuildContext context,
      bool is_api_get,
      )async{
    divisionList= await CustomHttp().getDivisionHttpRequest(api_end_point, context, is_api_get);
    notifyListeners();
  }
  ///    Division list      ///
  List districtList=[];
  districtProvider(
      String api_end_point,
      BuildContext context,
      bool is_api_get,
      )async{
    districtList= await CustomHttp().getDistrictHttpRequest(api_end_point, context, is_api_get);
    notifyListeners();
  }
  ///    Thana list      ///
  List thanalist=[];
  thanaProvider(
      String api_end_point,
      BuildContext context,
      bool is_api_get,
      )async{
    thanalist= await CustomHttp().getthanaHttpRequest(api_end_point, context, is_api_get);
    notifyListeners();
  }
  ///    Thana list      ///
  List userledger=[];
  userledgerProvider(
      String api_end_point,
      BuildContext context,
      bool is_api_get,
      )async{
    userledger= await CustomHttp().userledgerHttpRequest(api_end_point, context, is_api_get);
    notifyListeners();
  }
  ///     Pickup Area    ///
  List PickupArea=[];
  PickupAreaProvider(BuildContext context,)async{
    PickupArea= await CustomHttp().getPickupAreaHttpRequest(context);
    notifyListeners();
  }
  ///     Pickup Area    ///
  List  plan_list =[];
  plan_listProvider(BuildContext context,)async{
    plan_list= await CustomHttp().getplan_listHttpRequest(context);
    notifyListeners();
  }
  ///     Category list    ///
  List  category_list =[];
  category_listProvider(BuildContext context,)async{
    category_list= await CustomHttp().getCtegoryHttpRequest(context);
    notifyListeners();
  }
  ///     Total get order     ///
  List getTotalOrderList=[];

  getTotalOrderProvider(BuildContext context,)async{
    getTotalOrderList= await CustomHttp().getTotalOrder(context);
    notifyListeners();
  }

  // ///     Total payment history    ///
  // List getTotalpaymenthistoryList=[];
  // getTotalpPaymentHistoryProvider(BuildContext context,)async{
  //   getTotalpaymenthistoryList= await CustomHttp().getTotalpaymenthistory(context);
  //   notifyListeners();
  // }
  ///     Total payment request list  ///
  List getpaymentRequestListist=[];
  getgetpayment_requestProvider(BuildContext context,)async{
    getpaymentRequestListist= await CustomHttp().getpayment_request(context);
    notifyListeners();
  }
  ///     Total get order     ///
  dynamic getdatewiseList;
  getgetdatewiseListProvider(BuildContext context,String fromdate,String todate)async{
    getdatewiseList= await CustomHttp().getdatewiselist(context,"$fromdate", "$todate");
    notifyListeners();
  }
  ///     Pac     ///
  dynamic parceltracklist;
  parceltracklistProvider(BuildContext context,String parcel_id)async{
    parceltracklist= await CustomHttp().parceltracklistfunction(context,parcel_id);
    notifyListeners();
  }
  ///Get All notice
  dynamic notice=[];
  getnoticeRequesttProvider(BuildContext context)async{
    notice= await CustomHttp().getnoticeRequestt(context);
    notifyListeners();
  }


}
