part of '../otp_fields.dart';

class OtpTheme {
  final Color activeColor;
  final Color selectedColor;
  final Color disabledColor;
  final Color activeFillColor;
  final Color selectedFillColor;
  final Color inactiveFillColor;
  final Color errorBorderColor;
  final Color cursorColor;
  final BorderRadius borderRadius;
  final double fieldHeight;
  final double fieldWidth;
  final EdgeInsetsGeometry fieldOuterPadding;

  factory OtpTheme({
    Color? activeColor,
    Color? selectedColor,
    Color? disabledColor,
    Color? activeFillColor,
    Color? selectedFillColor,
    Color? inactiveFillColor,
    Color? errorBorderColor,
    BorderRadius? borderRadius,
    double? fieldHeight,
    double? fieldWidth,
  }) {
    const defaultValues = OtpTheme.defaults();
    return OtpTheme.defaults(
      activeColor: activeColor ?? defaultValues.activeColor,
      activeFillColor: activeFillColor ?? defaultValues.activeFillColor,
      borderRadius: borderRadius ?? defaultValues.borderRadius,
      disabledColor: disabledColor ?? defaultValues.disabledColor,
      fieldHeight: fieldHeight ?? defaultValues.fieldHeight,
      fieldWidth: fieldWidth ?? defaultValues.fieldWidth,
      inactiveFillColor: inactiveFillColor ?? defaultValues.inactiveFillColor,
      errorBorderColor: errorBorderColor ?? defaultValues.errorBorderColor,
      selectedColor: selectedColor ?? defaultValues.selectedColor,
      selectedFillColor: selectedFillColor ?? defaultValues.selectedFillColor,
    );
  }

  const OtpTheme.defaults({
    this.borderRadius = BorderRadius.zero,
    this.fieldHeight = 50,
    this.fieldWidth = 40,
    this.fieldOuterPadding = EdgeInsets.zero,
    this.activeColor = DrivenColors.primary,
    this.selectedColor = DrivenColors.primary,
    this.disabledColor = DrivenColors.normalGrey,
    this.activeFillColor = DrivenColors.white,
    this.selectedFillColor = DrivenColors.white,
    this.inactiveFillColor = DrivenColors.white,
    this.cursorColor = Colors.blue,
    this.errorBorderColor = Colors.redAccent,
  });
}
