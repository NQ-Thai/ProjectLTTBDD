
import 'package:flutter/material.dart';
import 'package:flutter_project/signup.dart';
import 'package:flutter_project/homePage.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool _hidePassword = true;
  IconData icon = Icons.visibility;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(24), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Đăng nhập", style: TextStyle(fontSize: 40, color: Color.fromARGB(255, 236, 143, 77)),),
            const SizedBox(height: 25),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Tên tài khoản',
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              obscureText: _hidePassword,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Mật khẩu',
                hintText: 'Nhập mật khẩu',
                suffixIcon: IconButton(onPressed: () {
                  setState(() {
                  _hidePassword = !_hidePassword;
                  icon = _hidePassword ? Icons.visibility : Icons.visibility_off; 
                  });
                }, 
                icon: Icon(icon),
                ),
              ),
            ),
            const SizedBox(height: 16),
            InkWell(
              onTap: () {
                 Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                  builder: (context) => const HomePage(),
                ),
                (route) => false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 236, 143, 77),
                ),
                child: const Text(
                  "Đăng nhập",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 30),
            const Text("Chưa có tài khoản?", style: TextStyle(fontSize: 15),),
            const SizedBox(height: 20),
            InkWell(
              onTap: () {
                 Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                  builder: (context) => const Signup(),
                ),
                (route) => false);
              },
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 14),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: const Color.fromARGB(255, 236, 143, 77),
                ),
                child: const Text(
                  "Đăng kí",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}