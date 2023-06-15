import 'package:get/get.dart';
import 'package:project/consts/consts.dart';

class HomeController extends GetxController{
  @override
  void onInit() {
    getUsername();
    super.onInit();
  }

  var currentNavIndex = 0.obs;
  var username = '';
  getUsername() async {
    var n = await fireStore.collection(usersCollection).where('id', isEqualTo: currenUser!.uid).get().then((value) {
      if (value.docs.isNotEmpty) {
        return value.docs.single['name'];
      }
    });
    username = n;
  }
}