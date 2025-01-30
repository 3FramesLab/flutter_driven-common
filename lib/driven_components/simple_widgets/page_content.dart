part of driven_components_module;

class PageContent extends StatelessWidget {
  final Widget body;
  final List<Widget> leading;
  final BoxDecoration? decoration;
  final double bottomSpacing;

  static const defaultDecoration = BoxDecoration(
    borderRadius: BorderRadius.only(
      topLeft: DrivenRectangleBorder.mediumRoundedRadius,
      topRight: DrivenRectangleBorder.mediumRoundedRadius,
    ),
    color: Colors.white,
  );

  const PageContent({
    required this.body,
    this.leading = const [],
    this.bottomSpacing = 70,
    super.key,
  }) : decoration = defaultDecoration;

  const PageContent.panels({
    required this.body,
    this.leading = const [],
    this.bottomSpacing = 70,
    super.key,
  }) : decoration = null;

  @override
  Widget build(BuildContext context) {
    return ClearFocusWrapper(
      body: LayoutBuilder(
        builder: (context, viewportConstraints) {
          return SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ...leading,
                _body(viewportConstraints.maxHeight),
              ],
            ),
          );
        },
      ),
    );
  }

  Widget _body(double maxHeight) {
    return Container(
      constraints: BoxConstraints(minHeight: maxHeight - bottomSpacing),
      decoration: decoration,
      child: body,
    );
  }
}
