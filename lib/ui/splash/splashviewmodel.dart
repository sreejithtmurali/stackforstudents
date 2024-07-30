import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import 'package:untitled1stack/main.dart';
import 'package:untitled1stack/service/apiservice.dart';

import '../../models/Products.dart';

class Splashviewmodel extends BaseViewModel{
  List<Products>?plist=[];
  Future<void> fetch() async {
    Apiservice apiservice=Apiservice();
    plist=await apiservice.fetchdata();
    notifyListeners();
  }



  TextEditingController controller=TextEditingController();
  void printdata(){
    print("Data:::::::::::::${controller.text}");
  }
  int? age;
  Timer? _timer;
  Splashviewmodel({required this.age});
  init(BuildContext context){
   fetch();
  }
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
}