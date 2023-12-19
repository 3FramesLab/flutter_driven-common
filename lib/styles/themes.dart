part of styles_module;

class Themes {
  static const InputDecorationTheme inputDecorationTheme = InputDecorationTheme(
    enabledBorder: DrivenInputBorder.inputBorder,
    focusedBorder: DrivenInputBorder.inputBorder,
    border: OutlineInputBorder(),
    contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
    hintStyle: TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 14,
      color: DrivenColors.greyBlue,
    ),
  );

  ThemeData get primary {
    return ThemeData(
      scaffoldBackgroundColor: DrivenColors.lightestGrey,
      primaryColor: DrivenColors.black,
      fontFamily: DrivenFonts.avertaFontFamily,
      elevatedButtonTheme:
          ElevatedButtonThemeData(style: DrivenButtonStyle.primaryElevated()),
      outlinedButtonTheme:
          OutlinedButtonThemeData(style: DrivenButtonStyle.primaryOutlined()),
      textButtonTheme:
          TextButtonThemeData(style: DrivenButtonStyle.primaryText()),
      textTheme: const TextTheme(
        bodyLarge: f14RegularBlack,
        titleLarge: f14RegularGrey,
        titleMedium: f16SemiboldBlack2,
      ),
      inputDecorationTheme: inputDecorationTheme,
      dividerColor: DrivenColors.lightGrey,
      checkboxTheme: DrivenCheckboxTheme.theme,
      unselectedWidgetColor: DrivenColors.grey600,
    );
  }
}
