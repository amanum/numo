import 'package:flutter/material.dart';
import 'package:gradient_borders/gradient_borders.dart';
import 'package:numo/ui/common/colors.dart';

class NumoCard extends StatelessWidget {
  const NumoCard({
    required this.child,
    this.padding = EdgeInsets.zero,
    super.key,
  });

  final EdgeInsets padding;
  final Widget child;
//717788
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(1),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [
            Color.fromRGBO(71, 77, 88, 1),
            NumoColors.backgroundBottom,
          ],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.3),
            offset: Offset(0, 5),
            blurRadius: 8,
            spreadRadius: 4,
          ),
        ],
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(19),
          // border: Border.all(
          //   color: NumoColors.btnBorder,
          //   width: 1,
          // ),
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
      ),
    );
  }
}
