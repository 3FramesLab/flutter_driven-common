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
    context.showFlash(builder: (context, controller) {
    return Align(
      alignment: Alignment.center,
      child: FlashBar(
        controller: controller,
        behavior: FlashBehavior.floating,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(16)),
            side: BorderSide(
              color: Colors.yellow,
              strokeAlign: BorderSide.strokeAlignInside,
            ),
          ),
        dismissDirections: const [FlashDismissDirection.startToEnd],
        content: SizedBox(
          width: double.infinity,
          child: Material(
            elevation: 24,
            child: SafeArea(
              top: false,
              child: Padding(
                padding: EdgeInsets.all(16),
                child: TextScaleClamp(child: Text(tooltip)),
              ),
            ),
          ),
        ),
      ),
    );
});
  }
}
