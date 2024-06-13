import 'package:flutter/material.dart';
import '../../utils/size_config.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final bool isOnStrike;
  final String name;
  final int runs;
  final int ballFaced;
  final VoidCallback onBatsmanPressed;
  final VoidCallback onTogglerPressed;
  final VoidCallback onIncRunsPressed;
  final VoidCallback onDecRunsPressed;
  final VoidCallback onIncBallsPressed;
  final VoidCallback onDecBallsPressed;

  const CustomListTile({
    Key? key,
    required this.isOnStrike,
    required this.name,
    required this.runs,
    required this.ballFaced,
    required this.onBatsmanPressed,
    required this.onTogglerPressed,
    required this.onIncRunsPressed,
    required this.onDecRunsPressed,
    required this.onIncBallsPressed,
    required this.onDecBallsPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 5,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          const SizedBox(
            width: 5,
          ),
          isOnStrike
              ? InkWell(
                  onTap: onTogglerPressed,
                  child: Icon(
                    Icons.arrow_right,
                    color: Colors.green,
                    size: SizeConfig.blockSizeVertical! * 4,
                  ),
                )
              : InkWell(
                  onTap: onTogglerPressed,
                  child: SizedBox(
                    width: SizeConfig.blockSizeVertical! * 4,
                    height: SizeConfig.blockSizeVertical! * 4,
                  ),
                ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: onBatsmanPressed,
              child: Txt(
                text: name,
                fontSize: SizeConfig.blockSizeVertical! * 3,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: onDecRunsPressed,
                child: SizedBox(
                  height: SizeConfig.blockSizeVertical! * 3,
                  width: SizeConfig.blockSizeVertical! * 3,
                ),
              ),
              InkWell(
                onTap: onIncRunsPressed,
                child: Text(
                  "$runs",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical! * 3,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: onIncBallsPressed,
                child: Text(
                  " ($ballFaced)",
                  style: TextStyle(
                    fontSize: SizeConfig.blockSizeVertical! * 3,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: onDecBallsPressed,
                child: SizedBox(
                  height: SizeConfig.blockSizeVertical! * 3,
                  width: SizeConfig.blockSizeVertical! * 3,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
