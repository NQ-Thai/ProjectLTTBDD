import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/consts/consts.dart';
import 'package:flutter_project/consts/list.dart';
import 'package:flutter_project/widgets/profile_screen/components/edit_profile.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    final nameUser = FirebaseAuth.instance.currentUser;
    return Container(
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(imgBackground), fit: BoxFit.fill)),
      child: Scaffold(
        backgroundColor: const Color.fromARGB(255, 236, 143, 77),
        body: SafeArea(
            child: Column(
          children: [
            //edit profile button
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: const Align(
                  alignment: Alignment.topRight,
                  child: Icon(
                    Icons.edit,
                    color: whiteColor,
                  )).onTap(() {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EditProfile(),
                    ),
                    (route) => false);
              }),
            ),

            //users details section

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                children: [
                  Image.asset(imgProfile2, width: 100, fit: BoxFit.cover)
                      .box
                      .roundedFull
                      .clip(Clip.antiAlias)
                      .make(),
                  10.widthBox,
                  Expanded(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      "Tài khoản".text.fontFamily(semibold).white.make(),
                      5.heightBox,
                      "${nameUser?.email}".text.white.make(),
                    ],
                  )),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        side: const BorderSide(
                      color: Colors.white,
                    )),
                    onPressed: () {
                      FirebaseAuth.instance.signOut();
                    },
                    child: const Text(
                      'Đăng xuất',
                      style: TextStyle(color: Colors.white),
                    ),
                  )
                ],
              ),
            ),

            20.heightBox,
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "00"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .size(16)
                        .make(),
                    5.heightBox,
                    "in your cart".text.color(darkFontGrey).make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .width(context.screenWidth / 3.4)
                    .height(80)
                    .padding(const EdgeInsets.all(4))
                    .make(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "20"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .size(16)
                        .make(),
                    5.heightBox,
                    "in your orders".text.color(darkFontGrey).make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .width(context.screenWidth / 3.4)
                    .height(80)
                    .padding(const EdgeInsets.all(4))
                    .make(),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    "30"
                        .text
                        .fontFamily(bold)
                        .color(darkFontGrey)
                        .size(16)
                        .make(),
                    5.heightBox,
                    "in your whislist".text.color(darkFontGrey).make(),
                  ],
                )
                    .box
                    .white
                    .rounded
                    .width(context.screenWidth / 3.4)
                    .height(80)
                    .padding(const EdgeInsets.all(4))
                    .make()
              ],
            ),

            //buttons section

            ListView.separated(
              shrinkWrap: true,
              separatorBuilder: (context, index) {
                return const Divider(
                  color: lightGrey,
                );
              },
              itemCount: profileButtonsList.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  leading: Image.asset(
                    profileButtonsIcon[index],
                    width: 22,
                  ),
                  title: profileButtonsList[index]
                      .text
                      .fontFamily(semibold)
                      .color(darkFontGrey)
                      .make(),
                );
              },
            )
                .box
                .white
                .rounded
                .margin(const EdgeInsets.all(12))
                .padding(const EdgeInsets.symmetric(horizontal: 16))
                .shadowSm
                .make()
          ],
        )),
      ),
    );
  }
}
