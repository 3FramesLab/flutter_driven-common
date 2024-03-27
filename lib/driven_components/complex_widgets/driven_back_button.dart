part of driven_components_module;

class DrivenBackButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final MainAxisSize mainAxisSize;
  final String buttonLabelText;
  final TextStyle? textStyle;
  final double? verticalSpacing;

  const DrivenBackButton({
    super.key,
    this.onPressed,
    this.textStyle,
    this.color = DrivenColors.purple,
    this.mainAxisSize = MainAxisSize.max,
    this.buttonLabelText = DrivenConstants.back,
    this.verticalSpacing = 0,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        padding: MaterialStateProperty.all<EdgeInsets>(EdgeInsets.zero),
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
          SizedBox(width: verticalSpacing),
          Flexible(
            child: Text(
              buttonLabelText,
              style: textStyle ??
                  TextStyle(
                    fontSize: 17,
                    color: color,
                  ),
              textScaleFactor: 1,
            ),
          ),
        ],
      ),
    );
  }
}
