import 'package:driven_common/driven_components/driven_components_module.dart';
import 'package:flutter/material.dart';

class FakeSlideUpContent extends StatelessWidget {
  final Color? backgroundColor;
  final Widget body;
  final Widget? footer;

  const FakeSlideUpContent({
    super.key,
    required this.body,
    this.backgroundColor = Colors.white,
    this.footer,
  });

  @override
  Widget build(BuildContext context) {
    Widget formattedBody = body;
    formattedBody = _fixedHeightScrollView(formattedBody);
    return _roundCorners(formattedBody);
  }

  Widget _roundCorners(Widget body) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: body,
    );
  }

  Widget _fixedHeightScrollView(Widget body) {
    return LayoutBuilder(builder: (context, viewportConstraints) {
      return SingleChildScrollView(
        child: DrivenColumn(
          color: backgroundColor,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          minHeight: viewportConstraints.maxHeight,
          children: [
            body,
            _footer(),
          ],
        ),
      );
    });
  }

  Widget _footer() {
    return Container(
      padding: const EdgeInsets.only(bottom: 45, top: 20),
      child: footer,
    );
  }
}
