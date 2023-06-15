import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/consts/firebase_consts.dart';

import 'home_controller.dart';

class CartController extends GetxController{
  var totalP = 0.obs;

  //text controller for shipping details
  var addressController = TextEditingController();
  var cityController = TextEditingController();
  var stateController = TextEditingController();
  var shipcodeController = TextEditingController();
  var phoneController = TextEditingController();


  var paymentIndex = 0.obs;

  late dynamic productSnapshot;

  var products = [];

  calculate(data) {
    totalP.value = 0;
    for (var i = 0; i < data.length; i++) {
      totalP.value = totalP.value + int.parse(data[i]['tprice'].toString());
    }
  }


  changerPaymentIndex(index) {
    paymentIndex.value = index;
  }

  placeMyOrder({required orderPaymentMethod, required totalAmount}) async {
    await getProductDetails();
    await fireStore.collection(ordersCollection).doc().set({
      'order_code': "1234567890",
      'order_date': FieldValue.serverTimestamp(),
      'order_by': currenUser!.uid,
      'order_by_name': Get.find<HomeController>().username,
      'order_by_email':currenUser!.email,
      'order_by_address': addressController.text,
      'order_by_state': stateController.text,
      'order_by_city': cityController.text,
      'order_by_phone': phoneController.text,
      'order_by_shipcode': shipcodeController.text,
      'shipping_method': "Giao tận nhà",
      'payment_method': orderPaymentMethod,
      'order_placed': true,
      'order_confirmed': false,
      'order_delivered': false,
      'order_on_delivery': false,
      'total_amount': totalAmount,
      'orders': FieldValue.arrayUnion(products)
    });
  }

  getProductDetails() {
    products.clear();
    for (var i = 0; i < productSnapshot.length; i++) {
      products.add({
        'img': productSnapshot[i]['img'],
        'qty': productSnapshot[i]['qty'],
        'title': productSnapshot[i]['title'],
      });
    }
    print(products);
  }

}