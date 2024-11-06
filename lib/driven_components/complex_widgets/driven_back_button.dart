part of driven_components_module;

class DrivenBackButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final MainAxisSize mainAxisSize;

  const DrivenBackButton({
    super.key,
    this.onPressed,
    this.color = DrivenColors.primary,
    this.mainAxisSize = MainAxisSize.max,
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
            width: 17,
            child: Icon(
              Icons.arrow_back_ios,
              color: color,
            ),
          ),
          SizedBox(
            width: 42,
            child: Text(
              DrivenConstants.back,
              style: f16SemiboldPrimary.copyWith(color: color),
              textScaler: const TextScaler.linear(1),
            ),
          ),
        ],
      ),
    );
  }
}
