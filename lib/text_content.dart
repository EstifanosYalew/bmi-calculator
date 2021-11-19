import 'package:flutter/material.dart';

class TextContent extends StatelessWidget {
  TextContent(this.label);
  final String label;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        label,
        style: TextStyle(
          fontSize: 18.0,
          color: Color(0xFF8D8E9F),
        ),
      ),
    );
  }
}
