import 'package:flutter/material.dart';
import 'package:huge_plant/core/colors.dart';
import 'package:huge_plant/body_home/navbar.dart';
import 'package:huge_plant/data/database_helper.dart';

class GetStartBtn extends StatelessWidget {
  const GetStartBtn({
    Key? key,
    required this.size,
    required this.textTheme,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
       onTap: () {
                  Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => CustomNavBar(dbHelper: DatabaseHelper(),)), //--------เข้าหน้าหลัก----------
                  );
                  },
      child: Container(
        margin: const EdgeInsets.only(top: 60),
        width: size.width / 1.5,
        height: size.height / 13,
        decoration: BoxDecoration(
            color: MyColors.btnColor, borderRadius: BorderRadius.circular(15)),
        child: Center(
          child: Text("เริ่มกันเลย", style: textTheme.headline4),
        ),
      ),
    );
  }
}

class SkipBtn extends StatelessWidget {
  const SkipBtn({
    Key? key,
    required this.size,
    required this.textTheme,
    required this.onTap,
  }) : super(key: key);

  final Size size;
  final TextTheme textTheme;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 60),
      width: size.width / 1.5,
      height: size.height / 13,
      decoration: BoxDecoration(
          border: Border.all(
            color: MyColors.btnBorderColor,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(15)),
      child: InkWell(
        borderRadius: BorderRadius.circular(15.0),
        onTap: onTap,
        splashColor: MyColors.btnBorderColor,
        child: Center(
          child: Text("ถัดไป", style: textTheme.headline3),
        ),
      ),
    );
  }
}
