part of driven_components_module;

class DarkDrivenScaffold extends BaseDrivenScaffold {
  DarkDrivenScaffold({
    super.key,
    Widget? body,
    bool withBackButton = false,
    EdgeInsets padding = EdgeInsets.zero,
    Widget? leading,
    double? leadingWidth,
  }) : super(
          appBar: withBackButton
              ? DarkLogoAppBar.withBackButton()
              : DarkLogoAppBar(
                  leading: leading,
                  leadingWidth: leadingWidth,
                ),
          backgroundColor: Colors.black,
          body: Padding(
            padding: padding,
            child: body,
          ),
          disableBack: !withBackButton,
          goesInactive: false,
        );

  static DarkDrivenScaffold withBackButton({required Widget body}) {
    return DarkDrivenScaffold(body: body, withBackButton: true);
  }
}
