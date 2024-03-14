part of driven_components_module;

class DrivenBackButton extends StatelessWidget {
  final void Function()? onPressed;
  final Color color;
  final MainAxisSize mainAxisSize;
  final String buttonLabelText;

  const DrivenBackButton({
    super.key,
    this.onPressed,
    this.color = DrivenColors.purple,
    this.mainAxisSize = MainAxisSize.max,
    this.buttonLabelText = DrivenConstants.back,
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
          SizedBox(
            width: 42,
            child: Text(
              buttonLabelText,
              style: TextStyle(
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
