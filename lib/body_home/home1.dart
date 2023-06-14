import 'package:flutter/material.dart';
import 'package:huge_plant/body_home/home_app_bar.dart';
import 'package:huge_plant/core/constants.dart';
import 'package:huge_plant/data/database_helper.dart';
import 'package:huge_plant/data/intro/plant_data_intro.dart';
import 'package:huge_plant/data/intro/details_page_intro.dart';
import 'package:huge_plant/page/type1/type1.dart';
import 'package:huge_plant/page/type3/type3.dart';
import 'package:huge_plant/page/type4/type4.dart';
import 'package:huge_plant/page/type5/type5.dart';
import 'package:huge_plant/page/type7/type7.dart';
import 'package:huge_plant/page/type8/type8.dart';
import '../page/type2/type2.dart';

// ignore: camel_case_categorys
class HomePage1 extends StatelessWidget {
  HomePage1({Key? key, required this.dbHelper}) : super(key: key);
  DatabaseHelper dbHelper;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          HomeAppBar(
            dbHelper: dbHelper,
          ),
          type(title: "ประเภท"),
          imagetype(),
          intro(title: "แนะนำ"),
          introImages(),
        ],
      ),
    );
  }
}

class intro extends StatelessWidget {
  const intro({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "แนะนำ",
                style: TextStyle(
                  //backgroundColor: Color.fromARGB(255, 217, 226, 231),
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Kanit',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class introImages extends StatelessWidget {
  const introImages({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      childAspectRatio: 0.68,
      physics: NeverScrollableScrollPhysics(), //ไม่ให้ grid เลื่อน
      crossAxisCount: 2,
      shrinkWrap: true,
      children: [
        for (int i = 1; i < 7; i++)
          Container(
            
            child: Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailsPage(
                                plant: plantsintro[i - 1],
                                dbHelper: DatabaseHelper(),
                              )),
                    );
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    child: Image.asset(
                      "images/intro/intro$i.jpg",
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

class imagetype extends StatelessWidget {
  const imagetype({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 200,
              child: ListView.builder(
                  itemCount: 1,
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Type1()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 160,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/type/type1.jpg"), //-----------ไม้พุ่ม
                                fit: BoxFit.cover,
                                opacity: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Type2()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 160,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/type/type2.jpg"), //-----------ไม้อวบน้ำ
                                fit: BoxFit.cover,
                                opacity: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Type3()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 160,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/type/type3.jpg"), //-----------ไม้เลื้อย
                                fit: BoxFit.cover,
                                opacity: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Type4()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 160,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/type/type4.jpg"), //-----------ไม้คลุมดิน
                                fit: BoxFit.cover,
                                opacity: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Type5()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 160,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/type/type5.jpg"), //-----------ไม้ดอก
                                fit: BoxFit.cover,
                                opacity: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Type7()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 160,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/type/type6.jpg"), //-----------ไม้ล้มลุก
                                fit: BoxFit.cover,
                                opacity: 1,
                              ),
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const Type8()),
                            );
                          },
                          child: Container(
                            padding: EdgeInsets.all(20),
                            width: 160,
                            margin: EdgeInsets.only(left: 15),
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/type/type7.jpg"), //-----------ไผ่
                                fit: BoxFit.cover,
                                opacity: 1,
                              ),
                            ),
                          ),
                        ),
                        
                      ],
                    );
                  }),
            ),
          ),
        ],
      ),
    );
  }
}

class type extends StatelessWidget {
  const type({
    Key? key,
    required this.title,
  }) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: kDefaultPadding / 4),
      child: Row(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "ประเภท",
              style: TextStyle(
                //backgroundColor: Color.fromARGB(255, 217, 226, 231),
                fontSize: 35,
                fontWeight: FontWeight.bold,
                fontFamily: 'Kanit',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
