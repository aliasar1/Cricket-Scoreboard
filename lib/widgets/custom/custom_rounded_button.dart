import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomRoundButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomRoundButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          shape: BoxShape.circle,
          border: Border.all(
            color: ColorsManager.primaryColor,
            width: 2.0,
          ),
        ),
        child: Center(
          child: FittedBox(
            child: Text(
              text,
              style: const TextStyle(
                color: ColorsManager.primaryColor,
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
