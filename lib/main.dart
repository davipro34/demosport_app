import 'package:flutter/material.dart';
import 'package:animator/animator.dart';
import 'package:animate_do/animate_do.dart';
import 'package:delayed_display/delayed_display.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Animation Dynamique';
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Animation Dynamique'),
        ),
        body: Center(
          child: Container(
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DelayedDisplay(
                  delay: Duration(milliseconds: 500),
                  child: Text('Hello World'),
                ),
                DelayedDisplay(
                  delay: Duration(milliseconds: 1500),
                  child: Text('Deuxième texte'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LineData extends StatelessWidget {
  final IconData iconName;
  final Color lineColor;
  final String lineTitle;
  final String lineNumber;
  final Duration animationDuration;
  const LineData(
      {super.key, required this.iconName, required this.lineColor, required this.lineTitle, required this.lineNumber, required this.animationDuration});

  @override
  Widget build(BuildContext context) {
    return SlideInLeft(
      duration: animationDuration,
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: lineColor,
              boxShadow: [
                BoxShadow(
                  color: Colors.white.withOpacity(0.1),
                  spreadRadius: 3,
                  blurRadius: 15,
                  offset: const Offset(0, 3),
                )
              ],
            ),
            child: Icon(iconName, color: Colors.white, size: 35),
          ),
          const SizedBox(width: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                lineNumber,
                style: const TextStyle(color: Colors.black, fontSize: 30),
              ),
              Text(
                lineTitle,
                style: TextStyle(
                  color: lineColor,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
