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
          child: AnimatedLogo(),
        ),
      ),
    );
  }
}

class AnimatedLogo extends StatelessWidget {
  const AnimatedLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Animator<double>(
      tween: Tween<double>(begin: 0, end: 200),
      cycles: 0,
      duration: const Duration(seconds: 2),
      builder: (context, animatorState, child ) => Container(
        height: animatorState.value,
        width: animatorState.value,
        child: const FlutterLogo(),
      ),
    );
  }
}