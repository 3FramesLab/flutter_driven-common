part of driven_components_module;

class TextScaleClamp extends StatelessWidget {
  const TextScaleClamp({
    required this.child,
    super.key,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final mediaQueryData = MediaQuery.of(context);
    final num constrainedTextScaleFactor =
        mediaQueryData.textScaleFactor.clamp(1.0, 1.3);

    return MediaQuery(
      data: mediaQueryData.copyWith(
        textScaleFactor: constrainedTextScaleFactor as double?,
      ),
      child: child,
    );
  }
}
