import 'package:flutter/material.dart';

class CurvedParentContainer extends StatelessWidget {
  final double height;
  final double width;
  final List<Color> gradientColors;
  final Widget child;
  final bool isLeft;

  const CurvedParentContainer({
    super.key,
    required this.height,
    required this.width,
    required this.gradientColors,
    required this.child,
    required this.isLeft,
  });

  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: !isLeft ? LeftSideCurveClipper() : RightSideCurveClipper(),
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: !isLeft
              ? const BorderRadius.only(
                  topLeft: Radius.circular(120),
                  bottomLeft: Radius.circular(120),
                )
              : const BorderRadius.only(
                  topRight: Radius.circular(120),
                  bottomRight: Radius.circular(120),
                ),
        ),
        child: Center(child: child),
      ),
    );
  }
}

class RightSideCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(size.width - 40, 0);
    path.quadraticBezierTo(
        size.width, size.height / 2, size.width - 40, size.height);
    path.lineTo(0, size.height);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

class LeftSideCurveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.moveTo(40, 0);
    path.quadraticBezierTo(0, size.height / 2, 40, size.height);
    path.lineTo(size.width, size.height);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
