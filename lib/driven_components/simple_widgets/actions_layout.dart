part of driven_components_module;

class ActionsLayout extends StatelessWidget {
  final List<Widget> actions;
  final Widget body;
  final EdgeInsets padding;
  final EdgeInsets actionsPadding;

  const ActionsLayout({
    required this.body,
    this.actions = const [],
    this.padding = const EdgeInsets.all(16),
    this.actionsPadding = const EdgeInsets.only(bottom: 38),
    super.key,
  });

  const ActionsLayout.panels({
    required this.body,
    this.actions = const [],
    this.padding = const EdgeInsets.symmetric(horizontal: 16),
    this.actionsPadding = const EdgeInsets.only(bottom: 38),
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DrivenColumn(
      padding: padding,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        body,
        _actions(),
      ],
    );
  }

  Widget _actions() {
    return Container(
      constraints: const BoxConstraints(minHeight: 150),
      padding: actionsPadding,
      margin: const EdgeInsets.only(top: 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: actions,
      ),
    );
  }
}
