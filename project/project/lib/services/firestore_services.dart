import 'package:project/consts/consts.dart';

class FirestorServices {
  //get user data
  static getUser(uid) {
    return fireStore
        .collection(usersCollection)
        .where('id', isEqualTo: uid)
        .snapshots();
  }

  //get products to category
  static getProducts(category) {
    return fireStore
        .collection(productsCollection)
        .where('p_category', isEqualTo: category)
        .snapshots();
  }

  //get cart
  static getCart(uid) {
    return fireStore
        .collection(cartCollection)
        .where('added_by', isEqualTo: uid)
        .snapshots();
  }

  //delete document
  static deleteDocument(docId) {
    return fireStore.collection(cartCollection).doc(docId).delete();
  }

  //get all chat message
  static getChatMessages(docId) {
    return fireStore
        .collection(chatsCollection)
        .doc(docId)
        .collection(messagescollection)
        .orderBy('created_on', descending: false)
        .snapshots();
  }

  static getAllOrders() {
    return fireStore
        .collection(ordersCollection)
        .where('order_by', isEqualTo: currenUser!.uid)
        .snapshots();
  }

  static getWishList() {
    return fireStore
        .collection(productsCollection)
        .where('p_wishlist', arrayContains: currenUser!.uid)
        .snapshots();
  }

  static getAllMessages() {
    return fireStore
        .collection(chatsCollection)
        .where('fromId', isEqualTo: currenUser!.uid)
        .snapshots();
  }

  static getCounts() async {
    var res = await Future.wait([
      fireStore
          .collection(cartCollection)
          .where('added_by', isEqualTo: currenUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      fireStore
          .collection(productsCollection)
          .where('p_wishlist', arrayContains: currenUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
      fireStore
          .collection(ordersCollection)
          .where('order_by', isEqualTo: currenUser!.uid)
          .get()
          .then((value) {
        return value.docs.length;
      }),
    ]);
    return res;
  }

  static allProductes() {
    return fireStore.collection(productsCollection).snapshots();
  }
}
