import 'package:flutter/material.dart';
import 'package:portfolio/src/view/shared/touchable_opacity.dart';

class RetroButton extends StatelessWidget {
  final Function? onPressed;
  final double size;
  final Icon icon;
  const RetroButton({
    Key? key,
    required this.onPressed,
    required this.size,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TouchableOpacity(
      onTap: onPressed,
      child: Container(
        width: size,
        height: size,
        child: Container(
          decoration: new BoxDecoration(
            shape: BoxShape.circle,
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: [0.0, 0.5, 1.0],
              colors: [
                Colors.white,
                Colors.white38,
                Colors.black38,
              ],
            ),
          ),
          child: Center(child: icon),
        ),
      ),
    );
  }
}
