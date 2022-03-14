import 'package:flutter/material.dart';
import 'package:portfolio/src/view/shared/program.dart';
// ignore: avoid_web_libraries_in_flutter
import 'dart:html' as html;

class MyPortfolio extends StatelessWidget {
  const MyPortfolio({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Program(
          titleColor: Colors.black,
          title: "Star Wars App",
          onTap: () {
            String url = "https://matheusc3m.github.io/gitsearchuser/";

            html.window.open(url, 'new tab');
          },
          image: "assets/starwars.png",
        ),
        Program(
          titleColor: Colors.black,
          title: "Music Player",
          onTap: () {
            String url = "https://github.com/matheusc3m/musicplayer";
            html.window.open(url, 'new tab');
          },
          image: "assets/music.png",
        ),
      ],
    );
  }
}
