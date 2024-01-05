import 'package:flutter/material.dart';

class BackDisabledWrapper extends StatelessWidget {
  final Widget child;

  const BackDisabledWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: child,
    );
  }
}
