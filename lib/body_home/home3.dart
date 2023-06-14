import 'dart:math';
import 'package:flutter/material.dart';
import 'package:huge_plant/data/model.dart';
import '../data/database_helper.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../search/search.dart';

// ignore: must_be_immutable
class PlantScreen extends StatefulWidget {
  PlantScreen({Key? key, required this.dbHelper}) : super(key: key);

  DatabaseHelper dbHelper;

  @override
  _PlantScreenState createState() => _PlantScreenState();
}

class _PlantScreenState extends State<PlantScreen> {
  // add List of Product variable for List creation
  List<Plant> plants = [];

  Future<dynamic> _showConfirmDialog(BuildContext context, String action) {
    return showDialog(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return AlertDialog(
              title: Text(
                  'Do you want to $action this item?'), //----popup เด้งมากดยืนยันการลบ
              actions: [
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, true);
                    },
                    child: const Text('Yes')),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(context, false);
                    },
                    child: const Text('No')),
              ]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => SearchScreen(dbHelper: widget.dbHelper),
                ),
              );
            },
            icon: const Icon(Icons.search_outlined),
          )
        ],
        title: const Text('Plant Favorite'),
        backgroundColor: Color.fromARGB(255, 190, 94, 209),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: widget.dbHelper.getStream(),
          builder: (context, AsyncSnapshot<QuerySnapshot> snapshot) {
            if (!snapshot.hasData) {
              return const Center(
                  child: CircularProgressIndicator()); // หมุนๆระหว่างรอข้อมูล
            }
            plants.clear();
            for (var element in snapshot.data!.docs) {
              plants.add(Plant(
                  name: element.get('name'),
                  favorite: element.get('favorite'),
                  category: element.get('category'),
                  image: element.get('image'),
                  id: element.id));
            }
            // create product array from
            return ListView.builder(
              itemCount: plants.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(
                    color: Colors.blue,
                  ),
                  secondaryBackground: Container(
                      color: Colors.red,
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      child: const Icon(Icons.delete_forever_outlined,
                          color: Colors.white, size: 30)),
                  onDismissed: (direction) {
                    if (direction == DismissDirection.endToStart) {
                      widget.dbHelper.deletePlant(plants[index]);
                    }
                  },
                  confirmDismiss: (direction) async {
                    if ((direction) == DismissDirection.endToStart) {
                      return await _showConfirmDialog(context, 'Delete');
                    }
                    return false;
                  },
                  child: Card(
                    child: ListTile(
                      title: Text(plants[index].name),
                      subtitle: Text('${plants[index].category.toString()}'),
                      trailing: plants[index].favorite == 1
                          ? const Icon(Icons.favorite_rounded,
                              color: Colors.red)
                          : null,
                      onTap: () async {
                        var result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                DetailScreen(plantdetail: plants[index]),
                          ),
                        );
                        setState(() {
                          if (result != null) {
                            plants[index].favorite = result;
                            widget.dbHelper.updatePlant(plants[index]);
                          }
                        });
                      },
                      leading: CircleAvatar(
                        backgroundImage: AssetImage(
                          ('${plants[index].image.toString()}'),
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          }),
    );
  }
}

class DetailScreen extends StatelessWidget {
  const DetailScreen({Key? key, required this.plantdetail}) : super(key: key);

  final Plant plantdetail;

  @override
  Widget build(BuildContext context) {
    var result = plantdetail.favorite;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 165, 165, 165),
        title: Text(
          plantdetail.name,
          style: TextStyle(
            color: Colors.white,
            fontSize: 25,
            fontWeight: FontWeight.bold,
            fontFamily: 'Kanit',
          ),
        ),
      ),
      body: Card(
        child: Column(
          children: [
            Container(
              alignment: Alignment.topCenter,
              padding: const EdgeInsets.all(300),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                    plantdetail.image.toString(),
                  ),
                  fit: BoxFit.fitHeight,
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.all(10),
              child: Center(
                child: Text(
                  plantdetail.name,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Kanit',
                  ),
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.only(top: 2),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        fixedSize: const Size(120, 40),
                        primary: plantdetail.favorite == 1
                            ? Colors.blueGrey
                            : Colors.redAccent),
                    child: plantdetail.favorite == 1
                        ? const Text('Unfavorite')
                        : const Text('Favorite'),
                    onPressed: () {
                      result = plantdetail.favorite == 1 ? 0 : 1;
                      Navigator.pop(context, result);
                    },
                  ),
                  ElevatedButton(
                    child: const Text('Close'),
                    style: ElevatedButton.styleFrom(
                      fixedSize: const Size(120, 40),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
