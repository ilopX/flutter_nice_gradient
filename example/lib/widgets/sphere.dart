import 'package:example/app/app_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:adobe_xd/gradient_xd_transform.dart';
import 'package:path_drawing/path_drawing.dart';

// topLeftGlass
// topRightGlass
// bottomGlass

class Sphere extends StatelessWidget {
  final Gradient gradient;

  const Sphere({Key key, @required this.gradient}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = AppTheme.of(context).sphereSize;

    return Container(
      constraints: BoxConstraints.expand(),
      alignment: Alignment.center,
      child: CustomPaint(
        size: Size(size, size),
        painter: SpherePainter(gradient),
      ),
    );
  }
}

class SpherePainter extends CustomPainter {
  final mainRect = Rect.fromLTWH(0, 0, 362.0, 362.0);
  final Gradient gradient;

  SpherePainter(this.gradient);

  @override
  void paint(Canvas canvas, Size size) {
    final scale = size.width / mainRect.width;
    canvas.scale(scale);

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

    final shader = gradient.createShader(mainRect);
    canvas.drawOval(mainRect, Paint()..shader = shader);

    final svgPath1 =
        '''M -6916.9140625 4907.205078125 C -6916.9140625 4907.205078125 -6915.54931640625 4868.74560546875 -6898.255859375 4839.39111328125 C -6880.9609375 4810.03466796875 -6847.7373046875 4789.78125 -6847.7373046875 4789.78125 C -6847.7373046875 4789.78125 -6833.74169921875 4793.19580078125 -6819.0634765625 4804.80078125 C -6804.3837890625 4816.4072265625 -6789.0244140625 4836.20458984375 -6789.0244140625 4836.20458984375 C -6789.0244140625 4836.20458984375 -6811.7802734375 4857.8212890625 -6825.890625 4881.71728515625 C -6839.99951171875 4905.611328125 -6842.7294921875 4932.23779296875 -6842.7294921875 4932.23779296875 C -6842.7294921875 4932.23779296875 -6860.59423828125 4929.84716796875 -6879.1396484375 4923.58935546875 C -6897.6845703125 4917.33154296875 -6916.9140625 4907.205078125 -6916.9140625 4907.205078125 Z''';
    final svgPath2 =
        '''M -6838.96826171875 4841.3232421875 C -6838.96826171875 4841.3232421875 -6837.26220703125 4827.4423828125 -6841.244140625 4813.5615234375 C -6845.22607421875 4799.68115234375 -6854.8984375 4785.796875 -6854.8984375 4785.796875 C -6854.8984375 4785.796875 -6823.2666015625 4800.703125 -6803.01318359375 4820.38720703125 C -6782.759765625 4840.0712890625 -6773.88671875 4864.53466796875 -6773.88671875 4864.53466796875 C -6773.88671875 4864.53466796875 -6772.748046875 4881.26220703125 -6776.16064453125 4893.6650390625 C -6779.5751953125 4906.0654296875 -6789.3603515625 4913.23388671875 -6789.3603515625 4913.23388671875 C -6789.3603515625 4913.23388671875 -6798.802734375 4885.470703125 -6811.65966796875 4867.26513671875 C -6824.5166015625 4849.06103515625 -6838.96826171875 4841.3232421875 -6838.96826171875 4841.3232421875 Z''';
    final svgPath3 =
        '''M 0 0 C 4.94908618927002 5.240978717803955 13.97362232208252 14.00251483917236 23.91031837463379 19.79993629455566 C 38.88446807861328 28.53763961791992 55.93801879882813 30.53703117370605 55.93801879882813 30.53703117370605 C 55.93801879882813 30.53703117370605 102.6604080200195 93.06144714355469 177.3692169189453 91.16720581054688 C 252.0758514404297 89.27241516113281 292.8168334960938 30.53703117370605 292.8168334960938 30.53703117370605 C 292.8168334960938 30.53703117370605 313.940185546875 28.81753540039063 329.77294921875 16.64195251464844 C 333.5924377441406 13.70509910583496 337.0321655273438 10.38246536254883 340.0524597167969 7.031591892242432 C 329.5785827636719 91.41872406005859 257.6114807128906 156.7310485839844 170.3888244628906 156.7310485839844 C 80.75766754150391 156.7310485839844 7.235908508300781 87.76441955566406 0 0 Z''';

    final path1 = Path()
      ..addPath(parseSvgPathData(svgPath1), Offset(6945.46, -4740.49))
      ..close();

    canvas.drawPath(path1, Paint()..color = Colors.white.withOpacity(0.5));

    final path2 = Path()
      ..addPath(parseSvgPathData(svgPath2), Offset(7118.79, -4754.86))
      ..close();

    canvas.drawPath(path2, Paint()..color = Colors.white.withOpacity(0.17));

    final path3 = Path()
      ..addPath(parseSvgPathData(svgPath3), Offset(10.81, 195.44))
      ..close();

    canvas.drawPath(path3, Paint()..color = Colors.white.withOpacity(0.23));

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

  @override
  bool shouldRepaint(SpherePainter oldDelegate) {
    return oldDelegate.gradient != gradient;
  }
}
