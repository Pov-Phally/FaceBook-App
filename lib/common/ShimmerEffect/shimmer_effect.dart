import 'package:flutter/material.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class ShimmerEffect extends StatelessWidget {
  const ShimmerEffect({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      duration: Duration(seconds: 1),
      interval: Duration(seconds: 1),
      color: Colors.grey,
      enabled: true,
      child: child,
    );
  }
}