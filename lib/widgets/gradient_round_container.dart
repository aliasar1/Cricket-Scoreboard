import 'package:flutter/widgets.dart';

class GradientRoundedContainer extends StatelessWidget {
  final double height;
  final double width;
  final List<Color> gradientColors;
  final Widget child;

  const GradientRoundedContainer({
    super.key,
    required this.height,
    required this.width,
    required this.gradientColors,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            gradientColors.first.withOpacity(0.0), // Transparent left
            gradientColors.first.withOpacity(0.6), // Middle fade
            gradientColors.last, // Solid right
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: const BorderRadius.only(
          topRight: Radius.circular(50),
          bottomRight: Radius.circular(50),
        ),
      ),
      child: child,
    );
  }
}
