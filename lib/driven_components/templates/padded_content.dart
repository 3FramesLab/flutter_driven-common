part of driven_components_module;

class PaddedContent extends StatelessWidget {
  final List<Widget> children;
  final bool isForm;
  late final EdgeInsets padding;

  PaddedContent.narrow({
    required this.children,
    this.isForm = false,
    super.key,
  }) {
    padding = const EdgeInsets.symmetric(horizontal: 28);
  }

  PaddedContent.subTitleText({
    required this.children,
    this.isForm = false,
    super.key,
  }) {
    padding = const EdgeInsets.fromLTRB(0, 13, 0, 5);
  }

  @override
  Widget build(BuildContext context) {
    Widget widget = Column(children: children);
    widget = _addForm(widget);
    return _addPadding(widget);
  }

  Widget _addPadding(Widget widget) {
    return Padding(
      padding: padding,
      child: Column(children: children),
    );
  }

  Widget _addForm(Widget widget) {
    if (isForm) {
      return Form(
        key: GlobalKey<FormState>(),
        child: widget,
      );
    } else {
      return widget;
    }
  }
}
