import 'package:project/consts/consts.dart';

class FirestorServices {

  //get user data
  static getUser(uid) {
    return fireStore.collection(usersCollection).where('id', isEqualTo: uid).snapshots();
  }

  //get products to category
  static getProducts(category) {
    return fireStore.collection(productsCollection).where('p_category', isEqualTo: category).snapshots();
  }
}