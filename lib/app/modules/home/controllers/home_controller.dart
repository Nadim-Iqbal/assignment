import 'dart:convert';

import 'package:assignment/app/helpers/mapping_data.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../firebase/firebase_remote_config.dart';
import '../../../model/model_view.dart';
import 'package:http/http.dart' as http;

class HomeController extends GetxController {
  //TODO: Implement HomeController
  List<Widget> details = [];


  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
    // getVal();
    getRequest();
  }
  List<dynamic> productsList = [];
  var responseData;

  Future<List<dynamic>> getRequest() async {
    productsList.clear();
    //replace your restFull API here.
    String url = "https://dummyjson.com/products";
    final response = await http.get(Uri.parse(url));

     responseData = json.decode(response.body);
    final List<dynamic> successList = responseData["products"];
    // final List<dynamic> citiesAndCounters = [];

    successList.forEach((products) {
      final Map<String, dynamic> list = {
        "brand": products["brand"],
            "title": products["title"],
            "discountPercentage": products["discountPercentage"],
            "price": products["price"],
      };

      productsList.add(list);
    });



    // print(response.body);
    print("Iqbal");
    print(responseData);

    //Creating a list to store input data;

    // dynamic? details;
    // details = responseData.products;
    dynamic details;
    // details = respon
    // for (var list in responseData) {
    //   Product detailsList = Product(
    //     brand: list["brand"],
    //     title: list["title"],
    //     discountPercentage: list["discountPercentage"],
    //     price: list["price"],
    //   );

      //Adding user to the list.
      // productsList.add(detailsList);
      print("Nadim");
      print(productsList.length);
      print(productsList);
    return productsList;
    }

    //  Adding user to the list.
    //   productsList = _notification.products!;
    //   print("Nadim");
    //   print(productsList);


  // getVal() async
  // {
  //   var remoteJsonList = (await FirebaseRemoteConfigService().initializeConfig());
  //   details = MappingData().mapData(remoteJsonList);
  //
  // }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
