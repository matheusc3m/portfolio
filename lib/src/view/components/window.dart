import 'package:flutter/material.dart';
import 'package:portfolio/src/view/shared/touchable_opacity.dart';

class Window {
  final BuildContext context;
  final Widget body;
  final Function? builder;

  Function? removeOverlay;
  OverlayEntry? overlay, overlayBackground;

  Window({required this.context, required this.body, this.builder}) {
    removeOverlay = () {
      overlayBackground!.remove();
      overlay!.remove();
    };

    overlay = OverlayEntry(
      builder: (context) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 30,
            width: 500,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(8), topRight: Radius.circular(8)),
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
                ],
              ),
            ),
            child: Row(
              children: [
                Spacer(),
                TouchableOpacity(
                  child: Image.asset("assets/close.png"),
                  onTap: () {
                    overlay!.remove();
                  },
                ),
                SizedBox(
                  width: 5,
                )
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            height: 500,
            width: 500,
            decoration: BoxDecoration(
              border: Border.all(color: Color(0xFF5551FF), width: 3),
              color: Colors.white,
            ),
            child: Material(color: Colors.transparent, child: body),
          )
        ],
      ),
    );

    buildOverlay(context);
  }

  void buildOverlay(BuildContext context) {
    Overlay.of(context)!.insertAll([overlay!]);
  }
}
