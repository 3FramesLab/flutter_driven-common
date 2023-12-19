part of driven_components_module;

class CancelButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String text;

  const CancelButton({
    required this.onPressed,
    this.text = DrivenConstants.cancel,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return UnderlinedButton.black(
      onPressed: onPressed,
      text: text,
    );
  }
}
