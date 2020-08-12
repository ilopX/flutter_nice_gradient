import 'package:example/app/app_theme.dart';
import 'package:example/widgets/sphere/sphere_painter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Sphere extends StatefulWidget {
  final Gradient gradient;

  const Sphere({
    Key key,
    @required this.gradient,
  }) : super(key: key);

  @override
  _SphereState createState() => _SphereState();
}

class _SphereState extends State<Sphere> with SingleTickerProviderStateMixin {
  AnimationController animationController;
  LinearGradient oldGradient;
  bool _isGlassShow = true;

  set isGlassShow(isVisible) {
    setState(() {
      _isGlassShow = isVisible;
    });
  }

  @override
  void initState() {
    oldGradient = widget.gradient;
    animationController = AnimationController(
      duration: Duration(seconds: 1),
      vsync: this,
    );
    super.initState();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(Sphere oldWidget) {
    if (oldWidget.gradient == widget.gradient) {
      return;
    }
    oldGradient = oldWidget.gradient;
    animationController.forward(from: 0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    final size = AppTheme.of(context).sphereSize;

    return Align(
      alignment: Alignment.center,
      child: Stack(
        children: [
          buildBackShadow(),
          buildSphere(size),
          buildFrontShadow(),
          buildClickableArea(size),
        ],
      ),
    );
  }

  Widget buildBackShadow() {
    return Transform.translate(
      offset: Offset(94, 363),
      child: Opacity(
        opacity: 0.8,
        child: Image(
          image: AssetImage('assets/Shadow.png'),
        ),
      ),
    );
  }

  Widget buildFrontShadow() {
    return Transform.translate(
      offset: Offset(14, 28),
      child: Image(
        image: AssetImage('assets/ShadowFront.png'),
      ),
    );
  }

  buildClickableArea(double size) {
    return ClipOval(
      child: Container(
        width: size,
        height: size,
        child: Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: () {
              isGlassShow = !_isGlassShow;
            },
          ),
        ),
      ),
    );
  }

  Widget buildSphere(double size) {
    return AnimatedBuilder(
      animation: animationController.view,
      builder: (context, child) {
        final animatedGradient = LinearGradient.lerp(
          oldGradient,
          widget.gradient,
          animationController.value,
        );

        return CustomPaint(
          size: Size(size, size),
          painter: SpherePainter(animatedGradient, _isGlassShow),
        );
      },
    );
  }
}
