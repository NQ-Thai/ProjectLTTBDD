import 'package:flutter/material.dart';
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
            decoration: BoxDecoration(color: Colors.pink),
            child: Text(
              'Drawheader',
              textScaleFactor: 1.5,
              style: TextStyle(color: Colors.black),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.message),
            title: const Text('home'),
            onTap: () {
              // _showcreen(context, gridview1());
            },
          ),
          ListTile(
            leading: const Icon(Icons.account_circle),
            title: const Text('major'),
            onTap: () {
              // _showcreen(context, gridview2());
            },
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text('setting'),
            onTap: () {
              // _showcreen(context, gridview3());
            },
          ),
        ],
      ),
    );
  }
}
