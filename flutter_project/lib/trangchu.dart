import 'package:flutter/material.dart';
import 'package:flutter_project/login.dart';

class Trangchu extends StatefulWidget {
  const Trangchu({Key? key}) :super(key: key);

  @override
  State<Trangchu> createState() => _TrangchuState();
}

class _TrangchuState extends State<Trangchu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
              title: const Text("Cửa hàng"),
              actions: [
                IconButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                  context, 
                    MaterialPageRoute(
                      builder: (context) => const Login(),
                    ),
                    (route) => false);
                  },
                  icon: const Icon(Icons.logout),
                )
              ],
            ),
      body: Container(
        padding: const EdgeInsets.all(24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
             Text("Trang chủ"),
          ],
        ),
        
      ),
    );
  }
}