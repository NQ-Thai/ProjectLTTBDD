import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/profile_screen/ProfileScreen.dart';
import 'package:page_transition/page_transition.dart';

class Drawerr extends StatefulWidget {
  const Drawerr({Key? key}) : super(key: key);

  @override
  State<Drawerr> createState() => _Drawerr();
}

class _Drawerr extends State<Drawerr> {
  void _showcreen(var context, var screen) {
    Navigator.pop(context);
    Navigator.pushReplacement(
      context,
      PageTransition(
        child: screen,
        type: PageTransitionType.rightToLeftWithFade,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final nameUser = FirebaseAuth.instance.currentUser;
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(color: Color.fromARGB(255, 236, 143, 77)),
            child: Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/startScreenn.png'),
                    backgroundColor: Color.fromARGB(255, 236, 143, 77),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    '${nameUser?.email}',
                    textScaleFactor: 1.3,
                    style: const TextStyle(color: Colors.white),
                  ),
                ],
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.account_circle,
                color: Color.fromARGB(255, 236, 143, 77)),
            title: const Text('Người dùng'),
            onTap: () {
              // _showcreen(context, ...());
              Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const ProfileScreen(),
                  ),
                  (route) => false);
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings,
                color: Color.fromARGB(255, 236, 143, 77)),
            title: const Text('Cài đặt'),
            onTap: () {
              // _showcreen(context, ...());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout,
                color: Color.fromARGB(255, 236, 143, 77)),
            title: const Text('Đăng xuất'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
