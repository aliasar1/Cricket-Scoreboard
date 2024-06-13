import 'package:aagpl_scoreboard/constants/colors.dart';
import 'package:flutter/material.dart';

import '../../utils/size_config.dart';

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
    SizeConfig().init(context);
    return InkWell(
      onTap: onPressed,
      child: Container(
        height: SizeConfig.blockSizeVertical! * 4.5,
        width: SizeConfig.blockSizeVertical! * 4.5,
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
              style: TextStyle(
                color: ColorsManager.primaryColor,
                fontSize: SizeConfig.blockSizeVertical! * 2.4,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
