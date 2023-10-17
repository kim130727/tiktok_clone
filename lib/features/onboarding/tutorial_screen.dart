import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/sizes.dart';

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Column(
        children: [
          Text(
            "Watch cool videos!",
            style: TextStyle(
              fontSize: Sizes.size40,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
