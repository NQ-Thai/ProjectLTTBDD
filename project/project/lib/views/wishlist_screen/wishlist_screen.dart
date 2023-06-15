import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:project/consts/consts.dart';
import 'package:project/services/firestore_services.dart';
import 'package:project/views/widgets_common/loading_indicator.dart';

class WishListScreen extends StatelessWidget {
  const WishListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        title: "Sản phẩm yêu thích"
            .text
            .color(darkFontGrey)
            .fontFamily(semibold)
            .make(),
      ),
      body: StreamBuilder(
          stream: FirestorServices.getWishList(),
          builder:
              (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return Center(
                child: loadingIndicator(),
              );
            } else if (snapshot.data!.docs.isEmpty) {
              return "Vẫn chưa có đơn hàng nào!"
                  .text
                  .color(darkFontGrey)
                  .makeCentered();
            } else {
              var data = snapshot.data!.docs;
              return Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (BuildContext context, int index) {
                          return ListTile(
                            leading: Image.network(
                              "${data[index]['p_imgs'][0]}",
                              width: 100,
                              fit: BoxFit.cover,
                            ),
                            title: "${data[index]['p_name']}"
                                .text
                                .fontFamily(semibold)
                                .size(16)
                                .make(),
                            subtitle: "${data[index]['p_price']}"
                                .numCurrency
                                .text
                                .color(redColor)
                                .fontFamily(semibold)
                                .make(),
                            trailing:
                                const Icon(Icons.favorite, color: redColor)
                                    .onTap(() async {
                              await fireStore
                                  .collection(productsCollection)
                                  .doc(data[index].id)
                                  .set({
                                    'p_wishlist': FieldValue.arrayRemove([currenUser!.uid])
                                  }, SetOptions(merge: true));
                            }),
                          );
                        }),
                  ),
                ],
              );
            }
          }),
    );
  }
}
