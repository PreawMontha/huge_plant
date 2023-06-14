import 'package:flutter/material.dart';
import 'package:huge_plant/page/type5/type_page5.dart';

import '../../data/flower/details_page_flowerl.dart';
import '../../data/flower/plant_data_flower.dart';

class Type5 extends StatelessWidget {
  const Type5 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: NestedScrollView(
                headerSliverBuilder: (ctx, i) => [
                      TypePage5(),
                    ],
                body: typepage())),
      ),
    );
  }
}

class categorypage extends StatefulWidget {
  @override
  State<categorypage> createState() => _categorypageState();
}

class _categorypageState extends State<categorypage> {
  bool showenResult = true;
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
class typepage extends StatelessWidget {
  const typepage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(), //ไม่ให้ grid เลื่อน
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 3; i++)
          Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPageFlower(plant: plantsflower[i-1])),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      "images/flower/flower$i.jpg",
                      height: 300,
                      width: 300,
                    ),
                  ),
                ),
              ],
            ),
          ),
      ],
    );
  }
}