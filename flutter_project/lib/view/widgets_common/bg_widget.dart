import 'package:flutter/material.dart';
import 'package:flutter_project/consts/consts.dart';

Widget bgWidget(Widget? hello){
  return Container(
    decoration: const BoxDecoration(
      image: DecorationImage(
        image: AssetImage(imgBackground), fit: BoxFit.fill)
    ),
    child: hello,
  );
}