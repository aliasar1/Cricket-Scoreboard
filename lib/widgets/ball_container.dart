import 'package:flutter/material.dart';
import '../utils/size_config.dart';

class BallContainer extends StatelessWidget {
  final String type;

  const BallContainer({
    super.key,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockSizeVertical! * 4.5,
      width: SizeConfig.blockSizeVertical! * 4.5,
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
            fontSize: SizeConfig.blockSizeVertical! * 1.5,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
