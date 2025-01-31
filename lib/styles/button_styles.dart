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
      textStyle: f16SemiBoldBlack,
    );
  }

  static ButtonStyle evPrimaryElevated() {
    return styleFrom(
      backgroundColor: DrivenColors.cpDarkBlue,
      primary: Colors.black,
      disabledBackgroundColor: DrivenColors.disabledButtonColor,
      disabledPrimary: Colors.white,
      minimumSize: const Size.fromHeight(48),
      shape: const DrivenRectangleBorder.withRadius(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      textStyle: f16SemiBoldBlack.copyWith(
        fontFamily: DrivenFonts.sfProDisplayFontFamily,
      ),
    );
  }

  static ButtonStyle primaryOutlined() {
    return styleFrom(
      backgroundColor: Colors.white,
      primary: DrivenColors.black,
      side: const BorderSide(width: 2, color: DrivenColors.lightGrey),
      minimumSize: const Size.fromHeight(48),
      shape: DrivenRectangleBorder.veryRounded,
      textStyle: f16SemiBoldBlack,
    );
  }

  static ButtonStyle evPrimaryOutlined() {
    return styleFrom(
      backgroundColor: DrivenColors.white,
      primary: DrivenColors.black,
      side: const BorderSide(width: 2, color: DrivenColors.lightGrey),
      minimumSize: const Size.fromHeight(48),
      shape: DrivenRectangleBorder.mediumRounded,
      textStyle: f16SemiBoldBlack.copyWith(
        fontFamily: DrivenFonts.sfProDisplayFontFamily,
      ),
    );
  }

  static ButtonStyle primaryText() {
    return styleFrom(primary: DrivenColors.primary, textStyle: f16Semibold);
  }

  static ButtonStyle evPrimaryText() {
    return styleFrom(
        primary: DrivenColors.cpDarkBlue,
        textStyle: f16Semibold.copyWith(
          fontFamily: DrivenFonts.sfProDisplayFontFamily,
        ));
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
