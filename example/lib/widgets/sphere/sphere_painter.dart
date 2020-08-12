import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:example/widgets/sphere/glass_paths.dart';
import 'package:flutter/material.dart';

class SpherePainter extends CustomPainter {
  final mainRect = Rect.fromLTWH(0, 0, 362.0, 362.0);
  final Gradient gradient;
  final bool isGlassShow;
  final glassPath = GlassPaths();

  SpherePainter(this.gradient, this.isGlassShow);

  @override
  void paint(Canvas canvas, Size size) {
    rescale(canvas, size.width);

    // paint shadow error:
    // https://github.com/AdobeXD/xd-to-flutter-plugin/issues/70
    // drawBackShadow(canvas);

    drawGradientCircle(canvas);

    if (isGlassShow) {
      drawGlass(canvas);
    }

    // draw shadow error:
    // https://github.com/AdobeXD/xd-to-flutter-plugin/issues/70
    // drawFrontShadow(canvas);
  }

  void rescale(Canvas canvas, double width) {
    final scale = width / mainRect.width;
    canvas.scale(scale);
  }

  void drawGradientCircle(Canvas canvas) {
    final shader = gradient.createShader(mainRect);
    canvas.drawOval(mainRect, Paint()..shader = shader);
  }

  void drawBackShadow(Canvas canvas) {
    final bottomShadowGradient = RadialGradient(
      center: Alignment(0.0, 0.0),
      radius: 0.5,
      colors: [
        const Color(0xff000000),
        const Color(0x00000000),
      ],
      stops: [0.0, 1.0],
      transform: GradientXDTransform(
        1.0,
        0.0,
        0.0,
        1.0,
        0.0,
        0.0,
        Alignment(0.0, 0.0),
      ),
    );

    final shadowRect = Rect.fromLTWH(80, 333, 201, 58);
    canvas.drawOval(shadowRect,
        Paint()..shader = bottomShadowGradient.createShader(shadowRect));

    canvas.drawShadow(
        Path()
          ..addOval(mainRect)
          ..close(),
        Color(0x4da8a8a8),
        30,
        true);
  }

  @override
  bool shouldRepaint(SpherePainter oldDelegate) {
    return oldDelegate.gradient != gradient ||
        oldDelegate.isGlassShow != isGlassShow;
  }

  void drawGlass(Canvas canvas) {
    canvas.drawPath(
      glassPath.path1,
      Paint()..color = Colors.white.withOpacity(0.5),
    );
    canvas.drawPath(
      glassPath.path2,
      Paint()..color = Colors.white.withOpacity(0.17),
    );
    canvas.drawPath(
      glassPath.path3,
      Paint()..color = Colors.white.withOpacity(0.23),
    );
  }

  void drawFrontShadow(Canvas canvas) {
    final shadowGradient = RadialGradient(
      center: Alignment(0.0, 1.11),
      radius: 0.778,
      colors: [
        const Color(0x3d000000),
        const Color(0x25000000),
        const Color(0x01000000),
        const Color(0x00000000)
      ],
      stops: [0.0, 0.322, 0.707, 1.0],
      transform: GradientXDTransform(
          1.0, 0.0, 0.0, 0.302, 0.0, 0.738, Alignment(0.0, 1.11)),
    );

    canvas.drawOval(
        mainRect, Paint()..shader = shadowGradient.createShader(mainRect));
  }
}
