import 'package:flutter/material.dart';
import 'package:numo/ui/common/numo_background.dart';

class NumoScaffold extends StatelessWidget {
  const NumoScaffold({required this.body, super.key});

  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NumoBackground(
        child: body,
      ),
    );
  }
}
