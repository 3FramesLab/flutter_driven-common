part of driven_components_module;

class RoundedButtonStyle extends ButtonStyle {
  RoundedButtonStyle({
    required Color backgroundColor,
    required Color primary,
    required double minimumHeight,
    required Color disabledBackgroundColor,
    BorderSide? side,
    EdgeInsets? padding,
    double? borderRadius,
  }) : super(
          textStyle: _textStyle(),
          foregroundColor: _textColor(primary),
          backgroundColor:
              _backgroundColor(backgroundColor, disabledBackgroundColor),
          minimumSize: _sizeFromHeight(minimumHeight),
          shape: _shape(minimumHeight, borderRadius: borderRadius),
          side: _side(side),
          padding: _padding(padding),
        );

  static WidgetStateProperty<TextStyle>? _textStyle() {
    return ButtonStyleButton.allOrNull<TextStyle>(f16Semibold);
  }

  static DrivenMaterialColor _textColor(Color? color) {
    return DrivenMaterialColor(
      color,
      DrivenColors.disabledButtonTextColor,
    );
  }

  static DrivenMaterialColor _backgroundColor(
      Color? color, Color? disabledBackgroundColor) {
    return DrivenMaterialColor(
      color,
      disabledBackgroundColor,
    );
  }

  static WidgetStateProperty<BorderSide?>? _side(BorderSide? side) {
    return ButtonStyleButton.allOrNull<BorderSide>(side);
  }

  static WidgetStateProperty<Size?>? _sizeFromHeight(double height) {
    return ButtonStyleButton.allOrNull<Size>(
      Size.fromHeight(height),
    );
  }

  static WidgetStateProperty<OutlinedBorder?>? _shape(double height,
      {double? borderRadius}) {
    return ButtonStyleButton.allOrNull<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(borderRadius ?? height / 2),
        ),
      ),
    );
  }

  static WidgetStateProperty<EdgeInsetsGeometry?>? _padding(
      EdgeInsets? padding) {
    return ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
      padding,
    );
  }
}
