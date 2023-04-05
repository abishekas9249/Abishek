import 'dart:ui';

import 'package:flutter/material.dart';

class CostWidget extends StatelessWidget {
  final Color color;
  final double cost;
  const CostWidget({super.key, required this.color, required this.cost});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "₹",
          style: TextStyle(
            fontSize: 10,
            color: color,
            fontFeatures: [
              FontFeature.subscripts(),
            ],
          ),
        ),
        Text(
          cost.toInt().toString(),
          style: TextStyle(
            color: color,
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          (cost - cost.toInt()).toStringAsFixed(2),
          style: TextStyle(
            color: color,
            fontSize: 10,
            fontFeatures: [
              FontFeature.subscripts(),
            ],
          ),
        ),
      ],
    );
  }
}
