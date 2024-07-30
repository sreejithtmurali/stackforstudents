import 'dart:convert';

import 'package:http/http.dart'as http;
import 'package:untitled1stack/models/Products.dart';
import 'package:untitled1stack/models/ResponseMain.dart';
class Apiservice {
  Future<List<Products>?> fetchdata() async {
    final response=await http.get(Uri.parse("https://dummyjson.com/products"));
    var jsonn=jsonDecode(response.body);
    var res=ResponseMain.fromJson(jsonn);
    var list=res.products;
    return list;
  }
}