import 'package:aagpl_scoreboard/constants/strings.dart';
import 'package:flutter/material.dart';

import '../constants/colors.dart';
import '../utils/size_config.dart';

class PageHeader extends StatelessWidget {
  const PageHeader({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      width: double.infinity,
      height: SizeConfig.blockSizeVertical! * 14,
      decoration: const BoxDecoration(
        color: ColorsManager.scaffoldBgColor,
        borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(60), bottomRight: Radius.circular(60)),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SizedBox(
            height: SizeConfig.screenHeight! * 0.13,
            width: SizeConfig.screenHeight! * 0.13,
            child: Image.asset(
              StringsManager.aagplLogo,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: SizeConfig.screenHeight! * 0.15,
            width: SizeConfig.screenHeight! * 0.35,
            child: Image.asset(
              StringsManager.cronysoftLogo,
              fit: BoxFit.fitWidth,
            ),
          ),
        ],
      ),
    );
  }
}
