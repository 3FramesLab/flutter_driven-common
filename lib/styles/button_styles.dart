part of styles_module;

class DrivenButtonStyle {
  static ButtonStyle primaryElevated() {
    return styleFrom(
      backgroundColor: DrivenColors.black,
      primary: Colors.white,
      disabledBackgroundColor: DrivenColors.disabledButtonColor,
      disabledPrimary: Colors.white,
      minimumSize: const Size.fromHeight(48),
      shape: DrivenRectangleBorder.veryRounded,
      textStyle: f16SemiboldBlack,
    );
  }

  static ButtonStyle primaryOutlined() {
    return styleFrom(
      backgroundColor: Colors.white,
      primary: DrivenColors.black,
      side: const BorderSide(width: 2, color: DrivenColors.lightGrey),
      minimumSize: const Size.fromHeight(48),
      shape: DrivenRectangleBorder.veryRounded,
      textStyle: f16SemiboldBlack,
    );
  }

  static ButtonStyle primaryText() {
    return styleFrom(
      primary: DrivenColors.brandPurple,
      textStyle: const TextStyle(
        fontWeight: DrivenFonts.fontWeightSemibold,
      ),
    );
  }

  static ButtonStyle transparentOverlay() {
    return ButtonStyle(
      overlayColor: MaterialStateProperty.resolveWith<Color?>(
        (states) {
          return Colors.transparent;
        },
      ),
    );
  }

  static ButtonStyle styleFrom({
    Color? backgroundColor,
    Color? primary,
    Color? disabledBackgroundColor,
    Color? disabledPrimary,
    TextStyle? textStyle,
    EdgeInsetsGeometry? padding,
    Size? minimumSize,
    Size? fixedSize,
    Size? maximumSize,
    BorderSide? side,
    OutlinedBorder? shape,
  }) {
    return ButtonStyle(
      textStyle: ButtonStyleButton.allOrNull<TextStyle>(textStyle),
      foregroundColor: DrivenMaterialColor(primary, disabledPrimary),
      backgroundColor:
          DrivenMaterialColor(backgroundColor, disabledBackgroundColor),
      padding: ButtonStyleButton.allOrNull<EdgeInsetsGeometry>(padding),
      minimumSize: ButtonStyleButton.allOrNull<Size>(minimumSize),
      fixedSize: ButtonStyleButton.allOrNull<Size>(fixedSize),
      maximumSize: ButtonStyleButton.allOrNull<Size>(maximumSize),
      side: ButtonStyleButton.allOrNull<BorderSide>(side),
      shape: ButtonStyleButton.allOrNull<OutlinedBorder>(shape),
    );
  }
}
