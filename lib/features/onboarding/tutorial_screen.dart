import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';

// Text(
//   "Watch cool videos!",
//   style: TextStyle(
//     fontSize: Sizes.size40,
//     fontWeight: FontWeight.bold,
//   ),
// ),
// Gaps.v16,
// Text(
//   "videos are personalized for you based on what you watch, like, and share.",
//   style: TextStyle(
//     fontSize: Sizes.size20,
//   ),
// ),

class TutorialScreen extends StatefulWidget {
  const TutorialScreen({super.key});

  @override
  State<TutorialScreen> createState() => _TutorialScreenState();
}

class _TutorialScreenState extends State<TutorialScreen> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: const Scaffold(
        body: AnimatedCrossFade(
          firstChild: Column(
            children: [
              Text(
                "Watch cool videos!",
                style: TextStyle(
                  fontSize: Sizes.size40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v16,
              Text(
                "videos are personalized for you based on what you watch, like, and share.",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
            ],
          ),
          secondChild: Column(
            children: [
              Text(
                "Follow the rules",
                style: TextStyle(
                  fontSize: Sizes.size40,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Gaps.v16,
              Text(
                "videos are personalized for you based on what you watch, like, and share.",
                style: TextStyle(
                  fontSize: Sizes.size20,
                ),
              ),
            ],
          ),
          crossFadeState: CrossFadeState.showFirst,
          duration: Duration(milliseconds: 300),
        ),
      ),
    );
  }
}
