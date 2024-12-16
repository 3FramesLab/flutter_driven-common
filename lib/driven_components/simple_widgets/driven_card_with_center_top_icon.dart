part of driven_components_module;

class DrivenCardWithCenterTopIcon extends StatelessWidget {
  final String svgIcon;
  final String text;
  final TextStyle? textStyle;
  final Color? borderColor;
  final VoidCallback? onTap;
  final bool isDisabled;
  final Icon? icon;
  final EdgeInsetsGeometry margin;
  final double padding;

  const DrivenCardWithCenterTopIcon({
    super.key,
    required this.text,
    this.svgIcon = '',
    this.icon,
    this.textStyle,
    this.borderColor,
    this.isDisabled = false,
    this.onTap,  
    this.margin =  EdgeInsets.zero , 
    this.padding = 16,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: _boxDecoration,
      margin: margin,
      child: Material(
        color: DrivenColors.transparent,
        child: InkWell(
          onTap: !isDisabled ? onTap : null,
          borderRadius: BorderRadius.circular(10),
          splashColor: DrivenColors.blue.withOpacity(0.3),
          highlightColor: DrivenColors.blue.withOpacity(0.1),
          child: Ink(
            width: double.infinity,
            child: Padding(
              padding:  EdgeInsets.all(padding),
              child: _content(),
            ),
          ),
        ),
      ),
    );
  }

  BoxDecoration get _boxDecoration =>
      UiHelper.drivenCardBoxDecoration().copyWith(
        border: borderColor == null
            ? null
            : Border.all(
                color: borderColor!,
                width: 2,
              ),
      );

  Widget _content() {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (svgIcon.isNotEmpty)
            Semantics(
              label: 'icon_$text',
              child: SvgPicture.asset(svgIcon),
            ),
          if (icon != null)
            Semantics(
              label: 'icon_$text',
              child: icon,
            ),
          const SizedBox(height: 2),
          Flexible(
            child: DrivenText(
              text: text,
              style: _textStyle,
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  TextStyle get _textStyle =>
      textStyle ?? (isDisabled ? f14SemiboldDisabled : f14SemiBoldBlack);
}
