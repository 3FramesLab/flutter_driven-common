import 'package:driven_common/driven_components/complex_widgets/app_logo.dart';
import 'package:driven_common/driven_components/driven_components_module.dart';
import 'package:flutter/material.dart';

class DarkLogoAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget? leading;
  final double? leadingWidth;

  @override
  final Size preferredSize = const Size.fromHeight(155);

  // ignore: prefer_const_constructors_in_immutables
  DarkLogoAppBar({
    super.key,
    this.leading,
    this.leadingWidth = 60,
  });

  // ignore: prefer_const_constructors_in_immutables
  DarkLogoAppBar.withBackButton({super.key})
      : leading = const DrivenBackButton(color: Colors.white),
        leadingWidth = 60;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      leading: leading,
      leadingWidth: leadingWidth,
      shadowColor: Colors.transparent,
      bottom: _logoAppBar(),
    );
  }

  PreferredSizeWidget _logoAppBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      backgroundColor: Colors.black,
      toolbarHeight: 110,
      title: const Center(child: AppLogo()), // Center needed for Pixel
    );
  }
}
