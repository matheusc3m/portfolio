import 'package:flutter/material.dart';
import 'package:portfolio/src/helpers.dart/howl_audio.dart';
import 'package:portfolio/src/view/components/media_player.dart';
import 'package:portfolio/src/view/components/my_portfolio.dart';
import 'package:portfolio/src/view/components/window.dart';
import 'package:portfolio/src/view/shared/program.dart';
import 'dart:html' as html;

class Programs extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Program(
          titleColor: Colors.white,
          onTap: () {
            return Window(
              context: context,
              body: MyPortfolio(),
            );
          },
          title: "My portfolio",
          image: "assets/folder.png",
        ),
        Program(
          titleColor: Colors.white,
          onTap: () {
            String url = "https://www.linkedin.com/in/matheus3m/";
            html.window.open(url, 'new tab');
          },
          title: "Linkedin",
          image: "assets/linkedin.png",
        ),
        Program(
          titleColor: Colors.white,
          title: "Github",
          onTap: () {
            String url = "https://github.com/matheusc3m";
            html.window.open(url, 'new tab');
          },
          image: "assets/github.png",
        ),
        Program(
          titleColor: Colors.white,
          title: "Numb",
          onTap: () {
            return Window(
              onClose: () {
                stopAudio();
              },
              height: 490,
              width: 400,
              padding: EdgeInsets.zero,
              context: context,
              body: MediaPlayer(),
            );
          },
          image: "assets/music.png",
        ),
      ],
    );
  }
}
