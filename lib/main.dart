import 'package:flutter/material.dart';
import 'package:animator/animator.dart';

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
        body: const Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconLogo(
                iconName: Icons.directions_walk,
                iconColor: Colors.green,
                animationDuration: Duration(milliseconds: 500)),
              IconLogo(
                  iconName: Icons.directions_run,
                  iconColor: Colors.lightBlue,
                  animationDuration: Duration(milliseconds: 600)),
              IconLogo(
                  iconName: Icons.directions_bike,
                  iconColor: Colors.purple,
                  animationDuration: Duration(milliseconds: 700)),
              IconLogo(
                  iconName: Icons.favorite,
                  iconColor: Colors.pink,
                  animationDuration: Duration(milliseconds: 800)),
              IconLogo(
                  iconName: Icons.more_vert,
                  iconColor: Colors.grey,
                  animationDuration: Duration(milliseconds: 900)),
            ],
          ),
        ),
      ),
    );
  }
}

class IconLogo extends StatelessWidget {
  final IconData iconName;
  final Color iconColor;
  final Duration animationDuration;

  const IconLogo(
      {super.key,
      required this.iconName,
      required this.iconColor,
      required this.animationDuration});

  @override
  Widget build(BuildContext context) {
    return Animator<double>(
      tween: Tween<double>(begin: 0, end: 50),
      cycles: 1,
      duration: animationDuration,
      builder: (context, animatorState, child) => Container(
        width: animatorState.value,
        height: animatorState.value,
        decoration: BoxDecoration(
          color: iconColor,
          borderRadius: BorderRadius.circular(50),
          boxShadow: [
            BoxShadow(
              color: Colors.white.withOpacity(0.1),
              spreadRadius: 3,
              blurRadius: 15,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          iconName,
          color: Colors.white,
          size: animatorState.value / 2,
        ),
      ),
    );
  }
}
