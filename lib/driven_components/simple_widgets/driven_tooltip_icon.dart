part of driven_components_module;

class DrivenTooltipIcon extends StatelessWidget {
  final Icon icon;
  final String tooltip;
  final Rx<Completer<dynamic>> completer = Completer().obs;

  DrivenTooltipIcon(this.icon, this.tooltip, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Semantics(
      container: true,
      label: tooltip,
      value: tooltip,
      child: SizedBox(
        height: 18,
        width: 25,
        child: IconButton(
          padding: EdgeInsets.zero,
          onPressed: () => _launchToolTip(context),
          icon: icon,
        ),
      ),
    );
  }

  void _launchToolTip(BuildContext context) {
    completer(Completer());
    showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentTextStyle: f13RegularGrey,
          contentPadding: const EdgeInsets.all(4),
          content: Text(
            tooltip,
            style: f13RegularGrey,
          ));});

  }
}
