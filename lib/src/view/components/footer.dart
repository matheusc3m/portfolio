import 'package:flutter/material.dart';

import 'package:portfolio/src/view/components/clock.dart';
import 'package:portfolio/src/view/shared/touchable_opacity.dart';

class Footer extends StatefulWidget {
  @override
  _FooterState createState() => _FooterState();
}

class _FooterState extends State<Footer> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Container(
        height: 50,
        width: double.infinity,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: Color(0xFF5CA5F9),
              width: 1,
            ),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                Color(0xFF5551FF),
                Color(0xFF275ddc),
              ],
              stops: [
                0.01,
                0.2,
                1,
              ]),
        ),
        child: Stack(
          children: [
            TouchableOpacity(
              onTap: () {},
              child: _leftMenu(),
            ),
            _rightMenu(),
          ],
        ),
      ),
    );
  }

  Widget _leftMenu() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        child: MouseRegion(
          opaque: true,
          onExit: (_) {
            setState(() {
              isHovering = false;
            });
          },
          onHover: (_) {
            setState(() {
              isHovering = true;
            });
          },
          child: Row(
            children: [
              SizedBox(
                width: 10,
              ),
              Image.network(
                "https://icon-library.com/images/windows-start-button-icon-download/windows-start-button-icon-download-19.jpg",
                height: 35,
                width: 35,
              ),
              SizedBox(
                width: 6,
              ),
              Text(
                "Start",
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.5, 0.5),
                      blurRadius: 3.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        height: 100,
        width: 150,
        decoration: BoxDecoration(
          border: Border(
            right: BorderSide(
              color: Colors.black,
              width: 0.3,
            ),
          ),
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.white,
                isHovering ? Colors.green : Color(0xFF0FA958),
              ],
              stops: [
                0.01,
                0.2,
              ]),
        ),
      ),
    );
  }
}

Widget _rightMenu() {
  return Align(
    alignment: Alignment.bottomRight,
    child: Container(
      child: Clock(),
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        border: Border(
          left: BorderSide(
            color: Colors.black,
            width: 0.3,
          ),
        ),
        gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.white,
              Color(0xFF4A9EF4),
            ],
            stops: [
              0.01,
              0.2,
            ]),
      ),
    ),
  );
}
