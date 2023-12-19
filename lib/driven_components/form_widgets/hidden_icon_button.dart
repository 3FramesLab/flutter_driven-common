part of driven_components_module;

class HiddenIconButton extends StatelessWidget {
  final bool isHidden;
  final VoidCallback onPressed;

  const HiddenIconButton({
    required this.isHidden,
    required this.onPressed,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: Icon(_hiddenIcon()),
      color: DrivenColors.lightGrey,
      focusColor: DrivenColors.lightGrey,
      hoverColor: DrivenColors.lightGrey,
      highlightColor: DrivenColors.lightGrey,
      splashColor: Colors.transparent,
    );
  }

  IconData _hiddenIcon() {
    return isHidden ? Icons.visibility_off : Icons.visibility;
  }
}
