part of driven_components_module;

class HelpTooltip extends StatelessWidget {
  final String tooltip;

  const HelpTooltip(this.tooltip, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DrivenTooltipIcon(_icon(), tooltip);
  }

  Icon _icon() {
    return const Icon(
      Icons.help,
      color: DrivenColors.black,
    );
  }
}
