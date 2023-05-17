import 'package:flutter/material.dart';
import 'package:flutter_project/signup.dart';
import 'package:flutter_project/trangchu.dart';

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
            const Text(
              "Đăng nhập",
              style: TextStyle(fontSize: 34),
            ),
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
                suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      _hidePassword = !_hidePassword;
                      icon = _hidePassword
                          ? Icons.visibility
                          : Icons.visibility_off;
                    });
                  },
                  icon: Icon(icon),
                ),
              ),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Trangchu(),
                      ),
                      (route) => false);
                },
                child: const Text("Đăng nhập")),
            const SizedBox(height: 25),
            const Text(
              "Chưa có tài khoản?",
              style: TextStyle(fontSize: 15),
            ),
            const SizedBox(height: 16),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Signup(),
                      ),
                      (route) => false);
                },
                child: const Text("Đăng kí tài khoản. ")),
          ],
        ),
      ),
    );
  }
}
