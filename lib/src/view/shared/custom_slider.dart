import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'package:flutter/services.dart';

// ignore: must_be_immutable
class CustomSlider extends StatefulWidget {
  CustomSlider({
    Key? key,
    required this.value,
    required this.imageUrl,
    required this.minDistance,
    required this.maxDistance,
    required this.onChanged,
  }) : super(key: key);
  final String imageUrl;
  final double maxDistance;
  final double minDistance;
  final void Function(double)? onChanged;
  double value;

  @override
  _CustomSliderState createState() => _CustomSliderState();
}

class _CustomSliderState extends State<CustomSlider> {
  ui.Image? customImage;
  Future<ui.Image> loadImage(String imageUrl) async {
    ByteData data = await rootBundle.load(imageUrl);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List());
    ui.FrameInfo fi = await codec.getNextFrame();
    return fi.image;
  }

  @override
  void initState() {
    loadImage(widget.imageUrl).then((image) {
      setState(() {
        customImage = image;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderThemeData(
        inactiveTrackColor: Colors.blueGrey,
        activeTrackColor: Colors.green.shade700,
        trackHeight: 5,
        thumbShape: SliderThumbImage(
            image: customImage,
            thumbRadius: 0,
            max: widget.maxDistance.toInt()),
        overlayShape: RoundSliderOverlayShape(overlayRadius: 20.0),
        valueIndicatorShape: RectangularSliderValueIndicatorShape(),
        valueIndicatorTextStyle: TextStyle(
          color: Colors.transparent,
        ),
        valueIndicatorColor: Colors.white,
      ),
      child: Container(
        child: Stack(
          children: <Widget>[
            Positioned(
              child: Slider(
                value: widget.value,
                min: widget.minDistance,
                max: widget.maxDistance,
                onChanged: widget.onChanged,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class SliderThumbImage extends SliderComponentShape {
  final ui.Image? image;
  final double thumbRadius;
  final int max;
  SliderThumbImage({this.image, required this.thumbRadius, required this.max});

  @override
  Size getPreferredSize(bool isEnabled, bool isDiscrete) {
    return Size.fromRadius(thumbRadius);
  }

  @override
  void paint(PaintingContext context, Offset center,
      {required Animation<double> activationAnimation,
      required Animation<double> enableAnimation,
      required bool isDiscrete,
      required TextPainter labelPainter,
      required RenderBox parentBox,
      required SliderThemeData sliderTheme,
      required TextDirection textDirection,
      required double value,
      required double textScaleFactor,
      required Size sizeWithOverflow}) {
    final canvas = context.canvas;
    final imageHeight = 2;

    Offset imageOffset = Offset(
      center.dx - 14,
      center.dy - 8,
    );

    Paint paint = Paint()..filterQuality = FilterQuality.high;

    if (image != null) {
      canvas.drawImage(image!, imageOffset, paint);
    }

    TextSpan span = new TextSpan(
        style: new TextStyle(
            fontSize: imageHeight / 2,
            fontWeight: FontWeight.w700,
            color: sliderTheme.valueIndicatorColor,
            height: 0.2),
        text: '${getValue(value)}');
    TextPainter tp = new TextPainter(
        text: span,
        textAlign: TextAlign.left,
        textDirection: TextDirection.ltr);
    tp.layout();
    Offset textCenter = Offset(
      center.dx - (tp.width / 2),
      center.dy - (tp.height / 0.32),
    );
    tp.paint(canvas, textCenter);
  }

  String getValue(double value) {
    return ((max * value).round()).toString();
  }
}
