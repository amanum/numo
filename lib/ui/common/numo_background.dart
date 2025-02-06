import 'package:flutter/material.dart';
import 'package:numo/ui/common/colors.dart';

class NumoBackground extends StatelessWidget {
  const NumoBackground({required this.child, super.key,});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            NumoColors.backgroundTop,
            NumoColors.backgroundBottom,
          ],
        ),
      ),
      child: child,
    );
  }
}
