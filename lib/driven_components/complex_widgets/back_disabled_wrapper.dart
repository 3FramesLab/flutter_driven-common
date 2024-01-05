part of driven_components_module;

class BackDisabledWrapper extends StatelessWidget {
  final Widget child;

  const BackDisabledWrapper({required this.child});

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: child,
    );
  }
}
