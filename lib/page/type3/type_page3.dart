import 'package:flutter/material.dart';

class TypePage3 extends StatelessWidget {
  const TypePage3({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: 100, //ระยะห่างข้างบน
      flexibleSpace: FlexibleSpaceBar(
        titlePadding: EdgeInsets.only(left: 20, bottom: 10),
        title: Text(
          "ไม้เลื้อย",
          style: TextStyle(fontSize: 27, color: Colors.black),
        ),
      ),
      backgroundColor: Colors.white,
      elevation: 0,
      floating: true,
    );
  }
}
