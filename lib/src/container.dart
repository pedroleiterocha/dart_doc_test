import 'package:flutter/material.dart';

/// Custom [Container].
///
/// Displays [child] with a fixed padding of 16.
class CustomContainer extends StatelessWidget {
  const CustomContainer({required this.child, super.key});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: child,
    );
  }
}
