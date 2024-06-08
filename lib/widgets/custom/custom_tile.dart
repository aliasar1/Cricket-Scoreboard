import 'package:flutter/material.dart';
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
    return Container(
      padding: const EdgeInsets.all(8.0),
      height: 50,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: Row(
        children: [
          isOnStrike
              ? InkWell(
                  onTap: onTogglerPressed,
                  child: const Icon(
                    Icons.arrow_right,
                    color: Colors.green,
                    size: 50,
                  ),
                )
              : InkWell(
                  onTap: onTogglerPressed,
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                  ),
                ),
          const SizedBox(width: 10),
          Expanded(
            child: InkWell(
              onTap: onBatsmanPressed,
              child: Txt(
                text: name,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(
            children: [
              InkWell(
                onTap: onDecRunsPressed,
                child: const SizedBox(
                  height: 40,
                  width: 40,
                ),
              ),
              InkWell(
                onTap: onIncRunsPressed,
                child: Text(
                  "$runs",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: onIncBallsPressed,
                child: Text(
                  " ($ballFaced)",
                  style: const TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.normal,
                    color: Colors.black,
                  ),
                ),
              ),
              InkWell(
                onTap: onDecBallsPressed,
                child: const SizedBox(
                  height: 40,
                  width: 40,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
