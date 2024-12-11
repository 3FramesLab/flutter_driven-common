part of driven_components_module;

class DrivenBackButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final MainAxisSize mainAxisSize;
  final double width;
  final String? backButtonText;

  const DrivenBackButton({
    super.key,
    this.onPressed,
    this.backButtonText = DrivenConstants.back,
    this.color = DrivenColors.primary,
    this.mainAxisSize = MainAxisSize.max,
    // TO-DO (Shailendra): Make it 24 as default once we remove admin_template in super-app
    this.width = 17,
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
            width: width,
            child: Icon(
              Icons.navigate_before,
              color: color,
            ),
          ),
          SizedBox(
            width: 42,
            child: Text(
              backButtonText.toString(),
              style: f16SemiboldPrimary.copyWith(color: color),
              textScaler: const TextScaler.linear(1),
            ),
          ),
        ],
      ),
    );
  }
}
