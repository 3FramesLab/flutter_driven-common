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

  Future<bool> _dismissTooltip() async {
    completer().complete();
    return false;
  }

  void _launchToolTip(BuildContext context) {
    completer(Completer());
    context.showFlashDialog(
      content: TextScaleClamp(child: Text(tooltip)),
      persistent: true,
      dismissCompleter: completer(),
      onWillPop: _dismissTooltip,
    );
  }
}
