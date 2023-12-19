part of driven_components_module;

class ClearFocusWrapper extends StatelessWidget {
  final Widget body;

  const ClearFocusWrapper({
    required this.body,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: UiHelper.clearFocus,
      child: body,
    );
  }
}
