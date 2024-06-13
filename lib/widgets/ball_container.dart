import 'package:flutter/material.dart';

class BallContainer extends StatelessWidget {
  final double size;
  final String type;

  const BallContainer({
    super.key,
    required this.size,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
        border: Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: Center(
        child: Text(
          type.toString(),
          style: TextStyle(
            color: Colors.black,
            fontSize: size / 2.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
