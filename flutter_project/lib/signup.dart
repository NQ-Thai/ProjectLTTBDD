import 'package:flutter/material.dart';
import 'package:flutter_project/login.dart';

class Signup extends StatefulWidget {
  const Signup({Key? key}) : super(key: key);

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
            const Text('Đăng kí', style: TextStyle(fontSize: 34),),
            const SizedBox(height: 16),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nhập số điện thoại',
              ),
            ),
            const SizedBox(height: 16),
            const TextField(
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Nhập tên tài khoản',
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
            TextField(
              obscureText: _hidePassword,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: 'Nhập lại mật khẩu',
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
            ElevatedButton(onPressed: () {
              Navigator.pushAndRemoveUntil(
                context, 
                MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
                (route) => false);
            }, 
            child:const Text("Đăng kí"))
          ],
        ),
      ),
    );
  }
}