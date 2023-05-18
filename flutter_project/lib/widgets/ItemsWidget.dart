import 'package:flutter/material.dart';
import 'package:flutter_project/pages/ItemPage.dart';

class ItemsWidget extends StatefulWidget {
  const ItemsWidget({Key? key}) : super(key: key);

  @override
  State<ItemsWidget> createState() => _ItemsWidgetState();
}

class _ItemsWidgetState extends State<ItemsWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 10, top: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Top",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 236, 143, 77),
                ),
              ),
              Text(
                "See all",
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              )
            ],
          ),
        ),
        GridView.count(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          physics: const NeverScrollableScrollPhysics(),
          crossAxisCount: 2,
          childAspectRatio: 0.8,
          shrinkWrap: true,
          children: [
            for (int i = 1; i < 8; i++)
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 4,
                      ),
                    ]),
                child: Column(
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ItemPage(),
                            ),
                            (route) => false);
                      },
                      child: Container(
                        margin: const EdgeInsets.all(10),
                        child: Image.asset(
                          "images/$i.png", 
                          height: 85,
                          width: 85,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Item title",
                          style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF555555)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Container(
                        alignment: Alignment.centerLeft,
                        child: const Text(
                          "Fresh Fruit 2KG",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF555555)),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            "\$20",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Color.fromARGB(255, 236, 143, 77),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Container(
                              padding: const EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: const Color.fromARGB(255, 236, 143, 77),
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Icon(
                                Icons.add_shopping_cart,
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              )
          ],
        )
      ],
    );
  }
}
