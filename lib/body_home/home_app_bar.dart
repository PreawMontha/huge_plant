import 'package:flutter/material.dart';
import 'package:huge_plant/search/search.dart';

import '../data/database_helper.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({Key? key, required this.dbHelper}) : super(key: key);
  DatabaseHelper dbHelper;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 35),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          InkWell(
            onTap: () {},
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black26,
                    blurRadius: 6,
                  ),
                ],
                borderRadius: BorderRadius.circular(14),
              ),
              child: Icon(
                Icons.sort_rounded,
                size: 28,
              ),
            ),
          ),
          Row(
            children: [
              Text(
                "Huge Tree",
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
          IconButton(onPressed:  () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => SearchScreen(
                  dbHelper: dbHelper,
                ),
              ),
            );
            
          }, 
          icon: const Icon(Icons.search, size: 40,)
          ),
        ],
      ),
    );
  }
}
