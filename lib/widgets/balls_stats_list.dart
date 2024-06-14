import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../controllers/score_controller.dart';
import '../utils/size_config.dart';
import 'ball_container.dart';

class BallsStatsList extends StatelessWidget {
  const BallsStatsList({
    super.key,
    required this.controller,
  });

  final ScoreController controller;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Expanded(
      child: Obx(() => ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: controller.currentOverBalls.length > 7
                ? 7
                : controller.currentOverBalls.length,
            itemBuilder: (context, index) {
              int displayIndex = controller.currentOverBalls.length > 7
                  ? controller.currentOverBalls.length - 7 + index
                  : index;
              String ball = controller.currentOverBalls[displayIndex];
              return ball == ""
                  ? Container()
                  : BallContainer(
                      type: ball,
                    );
            },
          )),
    );
  }
}
