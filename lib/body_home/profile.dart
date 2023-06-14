import 'package:flutter/material.dart';

class profile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      //theme: ThemeData(fontFamily: 'Fredoka'),
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 87, 34, 25),
        appBar: AppBar(
          title: Center(child: const Text('Profile')),
          backgroundColor: Color.fromARGB(255, 185, 82, 82),
        ),
        body: Column(children: [
          Image.asset('assets/images/profile.jpg'),
          const ListTile(
            title: Text(
              'Montha Aomngam',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              Icons.contacts,
              color: Color.fromARGB(255, 245, 189, 106),
            ),
          ),
          const ListTile(
            title: Text(
              'Preaw',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              Icons.add_comment_rounded,
              color: Color.fromARGB(255, 245, 189, 106),
            ),
          ),
          const ListTile(
            title: Text(
              '18 June 2001',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              Icons.cake,
              color: Color.fromARGB(255, 245, 189, 106),
            ),
          ),
          const ListTile(
            title: Text(
              '6321602965',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              Icons.card_giftcard,
              color: Color.fromARGB(255, 245, 189, 106),
            ),
          ),
          const ListTile(
            title: Text(
              '21 Years Old',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
            leading: Icon(
              Icons.person_pin,
              color: Color.fromARGB(255, 245, 189, 106),
            ),
          ),
          Container(child: 
                Row(
                  children: [
                    Center(child: Image.asset('assets/images/profile5.jpg')),
                    Center(child: Image.asset('assets/images/profile3.jpg')),
                    Center(child: Image.asset('assets/images/profile4.jpg')),
                  ],
                ),
                width: 400,
                height: 170,
              ),
          ]),
        ),
        
    );
  }
}

