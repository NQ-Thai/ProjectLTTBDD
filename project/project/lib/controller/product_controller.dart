import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:project/consts/consts.dart';
import 'package:project/models/category_model.dart';

class ProductController extends GetxController {
  var quantity = 0.obs;

  var totalPrice = 0.obs;

  var subcat = [];

  var isFav = false.obs;

  getSubCategories(title) async {
    subcat.clear();
    var data = await rootBundle.loadString("lib/services/category_model.json");
    var decoded = categoryModelFromJson(data);
    var s =
        decoded.categories.where((element) => element.name == title).toList();

    for (var e in s[0].subcategory) {
      subcat.add(e);
    }
  }

  increaseQuantity(totalQuantity) {
    if (quantity.value < totalQuantity) {
      quantity.value++;
    }
  }

  decreaseQuantity() {
    if (quantity.value > 0) {
      quantity.value--;
    }
  }

  calculateTotalPrice(price) {
    totalPrice.value = price * quantity.value;
  }

  addToCart({title, img, sellername, qty, tprice, context, vendorId}) async {
    await fireStore.collection(cartCollection).doc().set({
      'title': title,
      'img': img,
      'sellername': sellername,
      'qty': qty,
      'vendor_id': vendorId,
      'tprice': tprice,
      'added_by': currenUser!.uid
    }).catchError((error) {
      VxToast.show(context, msg: error.toString());
    });
  }

  resetValues() {
    totalPrice.value = 0;
    quantity.value = 0;
  }

  addToWishList(docId, context) async {
    await fireStore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayUnion([currenUser!.uid])
    }, SetOptions(merge: true));
    isFav(true);
    VxToast.show(context, msg: "Thêm vào yêu thích");
  }

  removeFromWishList(docId, context) async {
    await fireStore.collection(productsCollection).doc(docId).set({
      'p_wishlist': FieldValue.arrayRemove([currenUser!.uid])
    }, SetOptions(merge: true));
    isFav(false);
    VxToast.show(context, msg: "Bỏ yêu thích");
  }

  checkIfFav(data) async {
    if (data['p_wishlist'].contains(currenUser!.uid)) {
      isFav(true);
    } else {
      isFav(false);
    }
  }
}
