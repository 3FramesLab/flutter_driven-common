part of driven_components_module;

class DrivenBackButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final MainAxisSize mainAxisSize;
  final double iconWidth;
  final String? buttonText;
  final double buttonTextWidth;

  const DrivenBackButton({
    super.key,
    this.onPressed,
    this.buttonText = DrivenConstants.back,
    this.color = DrivenColors.primary,
    this.mainAxisSize = MainAxisSize.max,
    // TO-DO (Shailendra): Make it 24 as default once we remove admin_template in super-app
    this.iconWidth = 17,
    this.buttonTextWidth = 42,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: WidgetStateProperty.all<EdgeInsets>(EdgeInsets.zero),
      ),
      onPressed: onPressed ?? Get.back,
      child: Row(
        mainAxisSize: mainAxisSize,
        children: [
          SizedBox(
            width: iconWidth,
            child: Icon(
              Icons.navigate_before,
              color: color,
            ),
          ),
          SizedBox(
            width: buttonTextWidth,
            child: Text(
              buttonText.toString(),
              style: f16SemiboldPrimary.copyWith(color: color),
              textScaler: const TextScaler.linear(1),
            ),
          ),
        ],
      ),
    );
  }
}
