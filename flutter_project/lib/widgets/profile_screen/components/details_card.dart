// import 'package:flutter/material.dart';
// import 'package:flutter_project/consts/consts.dart';

// class DetalsCard extends StatefulWidget {
//   final String count;
//   final String title;
//   final String width;
//   const DetalsCard({Key? key, required this.count, required this.title, required this.width}) : super(key: key);

//   @override
//   State<DetalsCard> createState() => _DetalsCardState();
// }

// class _DetalsCardState extends State<DetalsCard> {
//   @override
  
//   Widget build(BuildContext context) {
//     return Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 "00".text.fontFamily(bold).color(darkFontGrey).size(16).make(),
//                 5.heightBox,
//                 "in your cart".text.color(darkFontGrey).make(),
//               ],
//             ).box.white.rounded.width(width).height(80).padding(const EdgeInsets.all(4)).make();
//   }
// }