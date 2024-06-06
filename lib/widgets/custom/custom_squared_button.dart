import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:flutter/material.dart';

class CustomSquareButton extends StatelessWidget {
  final String text;
  final VoidCallback onPressed;

  const CustomSquareButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: 44,
        width: 44,
        decoration: BoxDecoration(
          color: ColorsManager.whiteColor,
          borderRadius: BorderRadius.circular(8.0),
          border: Border.all(
            color: ColorsManager.primaryColor,
            width: 2.0,
          ),
        ),
        child: Center(
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
    );
  }
}
