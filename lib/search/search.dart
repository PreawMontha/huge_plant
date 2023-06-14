import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:huge_plant/data/database_helper.dart';
import 'package:huge_plant/data/intro/plant_model_intro.dart';
import 'package:huge_plant/data/model.dart';
import './widget/appbar.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key, required this.dbHelper}) : super(key: key);
  DatabaseHelper dbHelper;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusManager.instance.primaryFocus?.unfocus(),
      child: Scaffold(
          backgroundColor: Colors.white,
          body: MainBodySearch(
              )),
    );
  }
}

class MainBodySearch extends StatefulWidget {
  get dbHelper => DatabaseHelper();

  @override
  State<MainBodySearch> createState() => _MainBodySearchState();
}

class _MainBodySearchState extends State<MainBodySearch> {
  String _searchValue = '', category = '', name = '';
  List<Plant> resultPlants = [];

  bool found = false;

  void _showResponse(QuerySnapshot response) {
    setState(() {
      if (response.docs.isNotEmpty) {
        found = true;
        resultPlants.clear();
        for (var element in response.docs) {
          resultPlants.add(Plant(
            name: element.get('name'),
            image: element.get('image'),
            category: element.get('category'),
            favorite: element.get('favorite'),
          ));
        }
      } else {
        found = false;
      }
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Color.fromARGB(255, 0, 99, 5),
            title: Card(
              child: TextField(
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search), hintText: "Search"),
                  onChanged: (val) {
                    setState(() {
                      _searchValue = val;
                    });
                  }),
            )),
        body: StreamBuilder<QuerySnapshot>(
          stream: FirebaseFirestore.instance.collection('plants').snapshots(),
          builder: ((context, snapshot) {
            return (snapshot.connectionState == ConnectionState.waiting)
                ? Center(
                    child: CircularProgressIndicator(),
                  )
                : ListView.builder(
                    itemCount: snapshot.data!.docs.length,
                    itemBuilder: (context, index) {
                      var resultPlants = snapshot.data!.docs[index].data()
                          as Map<String, dynamic>;
                      if (_searchValue.isEmpty) {
                        return Card(
                          child: ListTile(
                            title: Text(
                              resultPlants['name'],
                              maxLines: 50,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Colors.black54,
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold),
                            ),
                            subtitle: Text(
                              resultPlants['category'],
                              overflow: TextOverflow.ellipsis,
                              style: TextStyle(
                                  color: Color.fromARGB(136, 8, 95, 22),
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold),
                            ),
                            leading: CircleAvatar(
                              backgroundImage:
                                  AssetImage(resultPlants['image']),
                            ),
                          ),
                        );
                      }
                      if (resultPlants['name']
                          .toString()
                          .toLowerCase()
                          .startsWith(_searchValue.toLowerCase())) {
                        return ListTile(
                          title: Text(
                            resultPlants['name'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Colors.black54,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          subtitle: Text(
                            resultPlants['category'],
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                                color: Color.fromARGB(136, 8, 95, 22),
                                fontSize: 16,
                                fontWeight: FontWeight.bold),
                          ),
                          leading: CircleAvatar(
                            backgroundImage: AssetImage(resultPlants['image']),
                          ),
                        );
                      }
                      return Container();
                    });
          }),
        )
        );
  }
}
