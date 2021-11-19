import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  ReusableCard(this.color, this.cardchid);
  final Color color;
  final Widget cardchid;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: cardchid,
      margin: EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          color: color, borderRadius: BorderRadius.circular(10.0)),
    );
  }
}
