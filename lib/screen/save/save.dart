import 'package:flutter/material.dart';

class SaveScreen extends StatelessWidget {
  const SaveScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        decoration: BoxDecoration(),
        height: 100,
        width: 100,
        // color: Colors.greenAccent,
      ).addGradient(Colors.red, Colors.yellow).roundedCorner(Colors.cyan, 40),
    );
  }
}

extension sample on Container {
  Container roundedCorner([Color? color, int? x]) {
    return Container(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(x?.toDouble() ?? 20),
        border: Border.all(),
      ),
      child: this,
    );
  }

  Container addGradient(Color colorStart, Color colorEnd) {
    return Container(
      // clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(40),
        gradient: LinearGradient(colors: [colorStart, colorEnd]),
      ),
      child: this,
    );
  }
}
