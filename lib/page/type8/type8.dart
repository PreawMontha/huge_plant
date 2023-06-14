import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:huge_plant/page/type1/type_page1.dart';
import 'package:huge_plant/page/type2/type_page2.dart';
import 'package:huge_plant/page/type8/type_page8.dart';

import '../../data/bamboo/details_page_bam.dart';
import '../../data/bamboo/plant_data_bam.dart';

class Type8 extends StatelessWidget {
  const Type8 ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
            child: NestedScrollView(
                headerSliverBuilder: (ctx, i) => [
                      TypePage8(),
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
        for (int i = 1; i < 2; i++)
          Container(
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                   Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) =>
                              DetailsPageBam(plant: plantsbam[i-1])),
                    );
                  },
                  child: Container(
                    child: Image.asset(
                      "images/bamboo/bamboo$i.jpg",
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