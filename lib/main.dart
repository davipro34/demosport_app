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
          child: IconLogo(iconName: Icons.directions_bike, iconColor: Colors.blue),
        ),
      ),
    );
  }
}

class IconLogo extends StatelessWidget {
  final IconData iconName;
  final Color iconColor;

  const IconLogo({super.key, required this.iconName, required this.iconColor});

  @override
  Widget build(BuildContext context) {
    return Animator<double>(
      tween: Tween<double>(begin: 0, end: 50),
      cycles: 1,
      duration: const Duration(seconds: 1),
      builder: (context, animatorState, child ) => Container(
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
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Icon(
          iconName,
          color: Colors.white,
          size: animatorState.value /2,
        ),
      ),
    );
  }
}