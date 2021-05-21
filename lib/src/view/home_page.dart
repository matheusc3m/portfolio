import 'package:flutter/material.dart';
import 'package:portfolio/src/view/components/footer.dart';

import 'components/programs.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/background.jpg"),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Programs(),
          Footer(),
        ],
      ),
    );
  }
}
