import 'package:driven_common/styles/styles_module.dart';
import 'package:flutter/material.dart';

class ViewLargeTitle extends StatelessWidget {
  final String title;
  final EdgeInsetsGeometry padding;

  const ViewLargeTitle({
    required this.title,
    this.padding = const EdgeInsets.fromLTRB(20, 15, 10, 20),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Semantics(
        container: true,
        child: Text(
          title,
          textAlign: TextAlign.left,
          style: f28ExtraboldBlackDark,
        ),
      ),
    );
  }
}
