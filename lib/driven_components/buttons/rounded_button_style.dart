part of driven_components_module;

class RoundedButtonStyle extends ButtonStyle {
  RoundedButtonStyle({
    required Color backgroundColor,
    required Color primary,
    required double minimumHeight,
    required Color disabledBackgroundColor,
    BorderSide? side,
    EdgeInsets? padding,
  }) : super(
          textStyle: _textStyle(),
          foregroundColor: _textColor(primary),
          backgroundColor:
              _backgroundColor(backgroundColor, disabledBackgroundColor),
          minimumSize: _sizeFromHeight(minimumHeight),
          shape: _shape(minimumHeight),
          side: _side(side),
          padding: _padding(padding),
        );

  static MaterialStateProperty<TextStyle>? _textStyle() {
    return ButtonStyleButton.allOrNull<TextStyle>(f16SemiboldBlack
        // const TextStyle(fontSize: 16, fontWeight: DrivenFonts.fontWeightSemibold),
        );
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

  static MaterialStateProperty<BorderSide?>? _side(BorderSide? side) {
    return ButtonStyleButton.allOrNull<BorderSide>(side);
  }

  static MaterialStateProperty<Size?>? _sizeFromHeight(double height) {
    return ButtonStyleButton.allOrNull<Size>(
      Size.fromHeight(height),
    );
  }

  static MaterialStateProperty<OutlinedBorder?>? _shape(double height) {
    return ButtonStyleButton.allOrNull<OutlinedBorder>(
      RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(height / 2),
        ),
      ),
    );
  }

  static MaterialStateProperty<EdgeInsetsGeometry?>? _padding(
      EdgeInsets? padding) {
    return ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(
      padding,
    );
  }
}
