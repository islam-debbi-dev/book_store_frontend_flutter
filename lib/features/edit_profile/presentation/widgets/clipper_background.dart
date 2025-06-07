// Custom clipper for pink background
import 'package:flutter/material.dart';

class CurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 100);

    // Create curved bottom
    // path.quadraticBezierTo(
    //     size.width * 0.5, size.height + 50, size.width, size.height - 100);

    path.cubicTo(size.width * 0.2, size.height - 70, size.width * 0.8,
        size.height + 60, size.width, size.height - 80);
    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}

// Custom clipper for blue background (different curve)
class BlueCurvedClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    path.lineTo(0, size.height - 30);

    // Create different curved pattern
    path.cubicTo(size.width * 0.1, size.height - 80, size.width * 0.8,
        size.height + 80, size.width, size.height - 100);

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
