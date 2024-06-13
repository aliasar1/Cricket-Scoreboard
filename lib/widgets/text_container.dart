import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../utils/size_config.dart';
import 'custom/custom_text.dart';

class TextContainer extends StatelessWidget {
  final String text;

  const TextContainer({
    Key? key,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.safeBlockVertical! * 20,
      width: SizeConfig.safeBlockHorizontal! * 30,
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.white,
            Color.fromARGB(255, 214, 213, 213),
          ],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Center(
        child: Txt(
          textAlign: TextAlign.center,
          text: text.toString(),
          fontSize: SizeConfig.safeBlockVertical! * 8,
          color: ColorsManager.primaryColor,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
