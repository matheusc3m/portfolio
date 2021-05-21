import 'package:flutter/material.dart';
import 'package:portfolio/src/view/shared/touchable_opacity.dart';

class Program extends StatefulWidget {
  final String image;
  final String title;
  final Color titleColor;
  final Function onTap;
  Program(
      {@required this.image,
      @required this.title,
      @required this.onTap,
      @required this.titleColor});
  @override
  _ProgramState createState() => _ProgramState();
}

class _ProgramState extends State<Program> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: widget.onTap,
      onDoubleTap: widget.onTap,
      child: Container(
        height: 100,
        width: 100,
        padding: EdgeInsets.all(10),
        color: isHovering ? Colors.white24 : Colors.transparent,
        child: MouseRegion(
          onHover: (_) {
            setState(() {
              isHovering = true;
            });
          },
          onExit: (_) {
            setState(() {
              isHovering = false;
            });
          },
          child: Center(
            child: Column(
              children: [
                Image.asset(
                  widget.image,
                  height: 50,
                  width: 50,
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    color: widget.titleColor,
                    shadows: <Shadow>[
                      Shadow(
                        offset: Offset(0.5, 0.5),
                        blurRadius: 3.0,
                        color: Color.fromARGB(255, 0, 0, 0),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
