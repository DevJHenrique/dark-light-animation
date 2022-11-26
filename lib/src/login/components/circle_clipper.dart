import 'package:flutter/material.dart';

class CircleClipper extends CustomClipper<Path> {
  CircleClipper({required this.center, required this.radius});
  final Offset center;
  final double radius;
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.addOval(
      Rect.fromCircle(
        radius: radius,
        center: center,
      ),
    );
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return true;
  }
}
