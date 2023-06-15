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
}
