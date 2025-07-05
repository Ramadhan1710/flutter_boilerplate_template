import 'package:flutter/material.dart';
import 'splash_logo.dart';

class SplashScreen extends StatelessWidget {
  final Duration duration;

  const SplashScreen({
    super.key,
    this.duration = const Duration(seconds: 2),
  });

  @override
  Widget build(BuildContext context) {
    Future.delayed(duration);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(child: SplashLogo()),
    );
  }
}
