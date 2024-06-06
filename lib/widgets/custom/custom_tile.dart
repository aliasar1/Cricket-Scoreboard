import 'package:flutter/material.dart';
import 'custom_text.dart';

class CustomListTile extends StatelessWidget {
  final bool isOnStrike;
  final String name;
  final String stats;
  final VoidCallback onBatsmanPressed;
  final VoidCallback onTogglerPressed;

  const CustomListTile({
    Key? key,
    required this.isOnStrike,
    required this.name,
    required this.stats,
    required this.onBatsmanPressed,
    required this.onTogglerPressed,
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
          Txt(
            text: stats,
            fontSize: 30,
            fontWeight: FontWeight.normal,
          ),
        ],
      ),
    );
  }
}
