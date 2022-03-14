import 'package:flutter/material.dart';
import 'package:portfolio/src/helpers.dart/howl_audio.dart';
import 'package:portfolio/src/view/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    initAudio(
        'http://shinawins.com/wp-content/uploads/2021/10/Linkin_Park_-_Numb_Shinawins.com.mp3');
    return MaterialApp(
      title: 'Portfolio',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Windows',
      ),
      home: HomePage(),
    );
  }
}
