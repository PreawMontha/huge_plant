import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:huge_plant/page/type1/type_page1.dart';
import 'package:huge_plant/page/type2/type_page2.dart';
import 'package:huge_plant/page/type7/type_page7.dart';

import '../../data/herbaceous/details_page_her.dart';
import '../../data/herbaceous/plant_data_her.dart';

class Type7 extends StatelessWidget {
  const Type7 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: NestedScrollView(
                headerSliverBuilder: (ctx, i) => [
                      TypePage7(),
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
                              DetailsPageHer(plant: plantsher[i-1])),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      "images/herbaceous/herbaceous$i.jpg",
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