import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/consts/consts.dart';
import 'package:project/controller/cart_controller.dart';
import 'package:project/services/firestore_services.dart';
import 'package:project/views/cart_screen/shipping_screen.dart';
import 'package:project/views/widgets_common/loading_indicator.dart';
import 'package:project/views/widgets_common/our_button.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(CartController());
    return Scaffold(
      backgroundColor: whiteColor,
      bottomNavigationBar: SizedBox(
        height: 60,
        child: ourButton(
          color: redColor,
          onPress: () {
            Get.to(() => const ShippingDetails());
          },
          textColor: whiteColor,
          title: "Tiến hành vận chuyển",
        ),
      ),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: "Giỏ hàng".text.color(darkFontGrey).fontFamily(semibold).make(),
      ),
      body: StreamBuilder(
          stream: FirestorServices.getCart(currenUser!.uid),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return Center(
                child: "Giỏ hàng trống".text.color(darkFontGrey).make(),
              );
            } else {
              var data = snapshot.data!.docs;
              controller.calculate(data);
              controller.productSnapshot = data;

              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Expanded(
                      child: ListView.builder(
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.network(
                              "${data[index]['img']}",
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            title:
                                "${data[index]['title']} (x${data[index]['qty']})"
                                    .text
                                    .fontFamily(semibold)
                                    .size(16)
                                    .make(),
                            subtitle: "${data[index]['tprice']}"
                                .numCurrency
                                .text
                                .color(redColor)
                                .fontFamily(semibold)
                                .make(),
                            trailing: const Icon(Icons.delete, color: redColor)
                                .onTap(() {
                              FirestorServices.deleteDocument(data[index].id);
                            }),
                          );
                        },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        "Tổng Giá"
                            .text
                            .fontFamily(semibold)
                            .color(darkFontGrey)
                            .make(),
                        Obx(
                          () => "${controller.totalP.value}"
                              .numCurrency
                              .text
                              .fontFamily(semibold)
                              .color(redColor)
                              .make(),
                        ),
                      ],
                    )
                        .box
                        .padding(const EdgeInsets.all(12))
                        .color(lightGolden)
                        .width(context.screenWidth - 60)
                        .roundedSM
                        .make(),
                    10.heightBox,
                    // SizedBox(
                    //     width: context.screenWidth - 60,
                    //     child: ourButton(
                    //       color: redColor,
                    //       onPress: () {},
                    //       textColor: whiteColor,
                    //       title: "Tiến hành vận chuyển",
                    //     )),
                  ],
                ),
              );
            }
          }),
    );
  }
}
