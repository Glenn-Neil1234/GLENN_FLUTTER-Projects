import 'package:flutter/material.dart';
import 'constants.dart';

class ReusableColumn extends StatelessWidget {
  ReusableColumn({required this.ikons, required this.label});

  final IconData ikons;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Icon(
        ikons,
        size: 80.0,
      ),
      SizedBox(
        height: 5.0,
      ),
      Text(
        label,
        style: KlabelTextStyle,
      ),
    ]);
  }
}
