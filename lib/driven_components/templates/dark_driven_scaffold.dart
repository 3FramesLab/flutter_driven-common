import 'package:driven_common/driven_components/complex_widgets/dark_logo_app_bar.dart';
import 'package:driven_common/driven_components/templates/driven_scaffold.dart';
import 'package:flutter/material.dart';

class DarkDrivenScaffold extends DrivenScaffold {
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
