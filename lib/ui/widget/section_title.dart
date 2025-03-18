import 'package:flutter/material.dart';

class SectionTitle extends StatelessWidget {
  const SectionTitle({super.key, required this.text});
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 5, top: 20),
      height: 60,
      child: Text(text, style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),)
    );
  }
}