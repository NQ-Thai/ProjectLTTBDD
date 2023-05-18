import 'package:flutter/material.dart';
import 'package:flutter_project/pages/startScreen.dart';

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
        home: const Scaffold(
            // appBar: AppBar(
            //   title: const Text("Cửa hàng"),
            //   actions: [
            //     IconButton(
            //       onPressed: () {},
            //       icon: const Icon(Icons.settings),
            //     )
            //   ],
            // ),
            body: StartScreen(),
            
            )
            );
  }
}
