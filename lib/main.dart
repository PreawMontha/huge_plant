import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:huge_plant/core/colors.dart';
import 'package:huge_plant/title/title.dart';
import 'dart:io';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  Platform.isAndroid
      ? await Firebase.initializeApp(
          options: const FirebaseOptions(
          apiKey: 'AIzaSyA3f01A2YcnoCAzEK6jIbBiiGG7kNm7g-o',
          appId: '1:15084950656:android:d021c9ba688538cd9b0265',
          messagingSenderId: '15084950656',
          projectId: 'huge-plant',
        ))
      : await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Huge Tree',
      theme: ThemeData(
          textTheme: const TextTheme(
        headline1: TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 41, 83, 50),
          fontWeight: FontWeight.bold,
        ),
        headline2: TextStyle(
            fontSize: 18,
            color: MyColors.subTitleTextColor,
            fontWeight: FontWeight.w400,
            wordSpacing: 1.2,
            height: 1.2),
        headline3: TextStyle(
          fontSize: 18,
          color: Color.fromARGB(255, 78, 156, 88),
          fontWeight: FontWeight.bold,
        ),
        headline4: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      )),
      home: const HomePage(),
    );
  }
}
