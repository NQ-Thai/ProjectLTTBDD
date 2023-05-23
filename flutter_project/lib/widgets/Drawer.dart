import 'package:flutter/material.dart';
import 'package:flutter_project/login.dart';
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
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(color: Color.fromARGB(255, 236, 143, 77)),
            child:
              
             Center(
              
               child: Column(

                 children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:AssetImage('images/startScreenn.png'),
                    backgroundColor: Color.fromARGB(255, 236, 143, 77) ,
                  ),
                  SizedBox(height: 20,),
                   Text(
                    'Cửa hàng online',
                    textScaleFactor: 1.5,
                    style: TextStyle(color: Colors.white),
                             ),
                 ],
               ),
             ),
          ),

          ListTile(
            leading: const Icon(Icons.account_circle, color: Color.fromARGB(255, 236, 143, 77)),
            title: const Text('Người dùng'),
            onTap: () {
              // _showcreen(context, ...());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings, color: Color.fromARGB(255, 236, 143, 77)),
            title: const Text('Cài đặt'),
            onTap: () {
              // _showcreen(context, ...());
            },
          ),
          ListTile(
            leading: const Icon(Icons.logout, color: Color.fromARGB(255, 236, 143, 77)),
            title: const Text('Đăng xuất'),
            onTap: () {
              _showcreen(context, const Login());
            },
          ),
        ],
      ),
    );
  }
}
