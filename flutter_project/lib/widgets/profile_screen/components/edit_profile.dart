import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/consts/consts.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  Widget build(BuildContext context) {
    final nameUser = FirebaseAuth.instance.currentUser;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Column(
            children: [
              Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
              10.heightBox,
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary:  const Color.fromARGB(255, 236, 143, 77),
                  padding: const EdgeInsets.all(12)
                ),
                onPressed: () {},
              child: const Text('Thay doi'),
              ),
              const Divider(),
              20.heightBox,
              // MyTextField(
              //   controller: ,
              //   hintText: 'Email',
              //   obscureText: false)
            ],
          ),
        ),
      ),
    );
  }
}