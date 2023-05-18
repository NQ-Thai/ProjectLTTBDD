import 'package:flutter/material.dart';
import 'package:flutter_project/login.dart';
import 'package:flutter_project/signup.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Cửa hàng',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: Scaffold(
            appBar: AppBar(
              title: const Text("Cửa hàng"),
              actions: [
                IconButton(
                  onPressed: () {},
                  icon: const Icon(Icons.settings),
                )
              ],
            ),
            body:const Login(),
            
            )
            );
  }
}
