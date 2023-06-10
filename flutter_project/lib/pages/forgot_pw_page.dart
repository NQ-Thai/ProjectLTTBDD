import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/components/my_textfield.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final _emailController = TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  Future passwordReset() async {
    try {
      await FirebaseAuth.instance
          .sendPasswordResetEmail(email: _emailController.text.trim());
          showDialog(
        context: context,
        builder: (context) {
          return const AlertDialog(
            content: Text('Link đổi mật khẩu đã được gửi! Hãy kiểm tra email của bạn!'),
          );
        },
      );
    } on FirebaseAuthException catch (e) {
      print(e);
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text(e.message.toString()),
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 236, 143, 77),
        elevation: 0,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 25.0),
            
            child: Text(
              'Nhập email của bạn và chúng tôi sẽ gửi link thay đổi mật khẩu',
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 10),
          MyTextField(
            controller: _emailController,
            hintText: 'Email',
            obscureText: false,
          ),
          const SizedBox(height: 10),
          MaterialButton(
            onPressed: passwordReset,
            child: const Text('Thay đổi mật khẩu', style: TextStyle(color: Colors.white),),
            color: const Color.fromARGB(255, 236, 143, 77),
          ),
        ],
      ),
    );
  }
}
