import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  final String imagePath;
  final double size;
  final String? title;

  const SplashLogo({
    super.key,
    this.imagePath = 'assets/images/logo.png',
    this.size = 150,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: size,
          height: size,
        ),
        if (title != null) ...[
          const SizedBox(height: 16),
          Text(
            title!,
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ]
      ],
    );
  }
}
