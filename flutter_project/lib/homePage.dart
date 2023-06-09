import 'package:badges/badges.dart' as badges;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/CartScreen.dart';
import 'package:flutter_project/widgets/CategoriesWidget.dart';
import 'package:flutter_project/widgets/Drawer.dart';
import 'package:flutter_project/widgets/ItemsWidget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: const Color.fromARGB(255, 236, 143, 77),
        actions: [
          Center(
            child: Padding(
              padding: const EdgeInsets.only(right: 20),
              child: Container(
                child: badges.Badge(
                  badgeStyle: const badges.BadgeStyle(
                    badgeColor: Colors.red,
                  ),
                  badgeContent: const Text(
                    '3',
                    style: TextStyle(color: Colors.white),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const CartScreen(),
                          ),
                          (route) => false);
                    },
                    child: const Icon(
                      CupertinoIcons.cart,
                      size: 35,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      drawer: const Drawerr(),
      backgroundColor: const Color.fromARGB(255, 236, 143, 77),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(right: 20, left: 15, top: 10),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [],
                ),
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: const EdgeInsets.only(top: 10, left: 15),
                child: const Column(
                  children: [
                    Text(
                      "Chào mừng",
                      style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Bạn muốn mua gì nào",
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.all(15),
                padding: const EdgeInsets.symmetric(horizontal: 15),
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.search),
                    Container(
                      margin: const EdgeInsets.only(left: 10),
                      width: 250,
                      child: TextFormField(
                        decoration: const InputDecoration(
                          hintText: "Tìm kiếm ở đây",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, right: 10),
                padding: const EdgeInsets.only(top: 30),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    )),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CategoriesWidget(),
                    // PopularItemWidget(),
                    ItemsWidget(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
