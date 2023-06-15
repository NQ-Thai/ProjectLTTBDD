import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project/controller/profile_controller.dart';
import 'package:project/views/widgets_common/bg_widget.dart';
import 'package:project/views/widgets_common/custom_textfield.dart';
import 'package:project/views/widgets_common/our_button.dart';

import '../../consts/consts.dart';

class EditProfileScreen extends StatelessWidget {
  final dynamic data;

  const EditProfileScreen({super.key, this.data});

  @override
  Widget build(BuildContext context) {
    var controller = Get.find<ProfileController>();

    return bgWidget(
        child: Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(),
      body: Obx(
        () => Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            //if data image url and controller path is empty
            data['imageUrl'] == '' && controller.profileImagePath.isEmpty
                ? Image.asset(
                    imgProfile2,
                    width: 100,
                    fit: BoxFit.cover,
                  ).box.roundedFull.clip(Clip.antiAlias).make()

                // if data is not empty but controller path is empty
                : data['imageUrl'] != '' && controller.profileImagePath.isEmpty
                    ? Image.network(
                        data['imageUrl'],
                        width: 90,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make()

                    //if both are empty
                    : Image.file(
                        File(controller.profileImagePath.value),
                        width: 90,
                        fit: BoxFit.cover,
                      ).box.roundedFull.clip(Clip.antiAlias).make(),
            10.heightBox,
            ourButton(
                color: redColor,
                onPress: () {
                  controller.changeImage(context);
                },
                textColor: whiteColor,
                title: "Thay đổi"),
            const Divider(),
            20.heightBox,
            customTextField(
                controller: controller.nameController,
                hint: nameHint,
                title: name,
                isPass: false),
            10.heightBox,
            customTextField(
                controller: controller.oldPassController,
                hint: passwordHint,
                title: oldPass,
                isPass: true),
            10.heightBox,
            customTextField(
                controller: controller.newPassController,
                hint: passwordHint,
                title: newPass,
                isPass: true),
            20.heightBox,
            controller.isLoading.value
                ? const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(redColor),
                  )
                : SizedBox(
                    width: context.screenWidth - 60,
                    child: ourButton(
                        color: redColor,
                        onPress: () async {
                          controller.isLoading(true);

                          //if image is not selected
                          if (controller.profileImagePath.value.isNotEmpty) {
                            await controller.uploadProfileImage();
                          } else {
                            controller.profileImageLink = data['imageUrl'];
                          }

                          //if old password matches data base

                          if (data['password'] ==
                              controller.oldPassController.text) {
                              
                              await controller.changeAuthPassword(
                                email: data['email'],
                                password: controller.oldPassController.text,
                                newpassword: controller.newPassController.text
                              );
                            
                            await controller.updateProfile(
                                imgUrl: controller.profileImageLink,
                                name: controller.nameController.text,
                                password: controller.newPassController.text);
                            VxToast.show(context, msg: "Đã cập nhật");
                          } else {
                            VxToast.show(context, msg: "Mật khẩu cũ sai");
                            controller.isLoading(false);
                          }
                        },
                        textColor: whiteColor,
                        title: "Lưu")),
          ],
        )
            .box
            .white
            .shadowSm
            .padding(const EdgeInsets.all(16))
            .margin(const EdgeInsets.only(top: 50, left: 12, right: 12))
            .rounded
            .make(),
      ),
    ));
  }
}
