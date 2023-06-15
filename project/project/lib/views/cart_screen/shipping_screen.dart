import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/consts/consts.dart';
import 'package:project/controller/cart_controller.dart';
import 'package:project/views/cart_screen/payment_method.dart';
import 'package:project/views/widgets_common/custom_textfield.dart';
import 'package:project/views/widgets_common/our_button.dart';

class ShippingDetails extends StatelessWidget {
  const ShippingDetails({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<CartController>();
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Thông tin Giao hàng".text.fontFamily(semibold).color(darkFontGrey).make(),
      ),
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          onPress: () {
            if (controller.addressController.text.length > 5) {
              Get.to(() => const PaymentMethods());
            } else {
              VxToast.show(context, msg: "Hãy điền thông tin");
            }
          },
          color:  redColor,
          textColor: whiteColor,
          title: "Tiếp tục",
        ),
      ),

      body:  Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            customTextField(hint: "Địa chỉ", isPass: false, title: "Địa chỉ", controller: controller.addressController),
            customTextField(hint: "Thành phố", isPass: false, title: "Thành phố", controller: controller.cityController),
            customTextField(hint: "Quốc gia", isPass: false, title: "Quốc gia", controller: controller.stateController),
            customTextField(hint: "ShipCode", isPass: false, title: "ShipCode", controller: controller.shipcodeController),
            customTextField(hint: "Số điện thoại", isPass: false, title: "Số điện thoại", controller: controller.phoneController),
          ],
        ),
      ),
    );
  }
}