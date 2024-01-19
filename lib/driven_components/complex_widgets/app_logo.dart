import 'package:driven_common/globals.dart';
import 'package:flutter/material.dart';

class AppLogo extends StatefulWidget {
  final double? topPadding;
  final String? appLogoPath;
  const AppLogo({
    Key? key,
    this.topPadding,
    this.appLogoPath,
  }) : super(key: key);

  @override
  State<AppLogo> createState() => _AppLogoState();
}

class _AppLogoState extends State<AppLogo> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: widget.topPadding ?? 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [_appLogo],
      ),
    );
  }

  Widget get _appLogo => Image.asset(Globals().appLogoPath);
}
