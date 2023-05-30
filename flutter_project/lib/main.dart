import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/pages/auth_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
  );
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
            body : AuthPage(),
            
            )
            );
  }
}
