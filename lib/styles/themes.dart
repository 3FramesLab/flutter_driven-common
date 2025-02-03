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
      useMaterial3: false,
      textSelectionTheme:
          const TextSelectionThemeData(cursorColor: Colors.blue),
      scaffoldBackgroundColor: DrivenColors.lightestGrey,
      primaryColor: DrivenColors.primary,
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
        titleMedium: f16SemiBoldBlack2,
      ),
      inputDecorationTheme: inputDecorationTheme,
      dividerColor: DrivenColors.lightGrey,
      checkboxTheme: DrivenCheckboxTheme.theme,
      unselectedWidgetColor: DrivenColors.grey600,
    );
  }

  ThemeData get dcThemeData => ThemeData(
        useMaterial3: false,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.blue),
        scaffoldBackgroundColor: DrivenColors.lightestGrey,
        primaryColor: DrivenColors.primary,
        fontFamily: DrivenFonts.avertaFontFamily,
        elevatedButtonTheme:
            ElevatedButtonThemeData(style: DrivenButtonStyle.primaryElevated()),
        outlinedButtonTheme:
            OutlinedButtonThemeData(style: DrivenButtonStyle.primaryOutlined()),
        textButtonTheme:
            TextButtonThemeData(style: DrivenButtonStyle.primaryText()),
        textTheme: const TextTheme(
          labelSmall: f14RegularGrey,
          labelMedium: f14SemiBoldGrey700,
          labelLarge: f20SemiBoldBlack,
          bodySmall: f10RegularRed,
          bodyMedium: f14RegularBlack,
          bodyLarge: f20RegularBlack,
          titleMedium: f14SemiBoldGrey700,
          titleSmall: f14RegularLightGrey,
          titleLarge: f14RegularGrey,
        ),
        inputDecorationTheme: inputDecorationTheme,
        dividerColor: DrivenColors.lightGrey,
        checkboxTheme: DrivenCheckboxTheme.theme,
        unselectedWidgetColor: DrivenColors.grey600,
        iconTheme: const IconThemeData(color: DrivenColors.primary),
      );

  ThemeData get evThemeData => ThemeData(
        useMaterial3: false,
        textSelectionTheme:
            const TextSelectionThemeData(cursorColor: Colors.blue),
        scaffoldBackgroundColor: DrivenColors.lightestGrey,
        primaryColor: DrivenColors.cpPrimary,
        fontFamily: DrivenFonts.sfProDisplayFontFamily,
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: DrivenButtonStyle.evPrimaryElevated()),
        outlinedButtonTheme: OutlinedButtonThemeData(
            style: DrivenButtonStyle.evPrimaryOutlined()),
        textButtonTheme:
            TextButtonThemeData(style: DrivenButtonStyle.evPrimaryText()),
        textTheme: TextTheme(
          labelSmall:
              f14RegularBlackSfPro.copyWith(color: DrivenColors.grey108),
          labelMedium: f14RegularBlackSfPro,
          bodySmall: f10RegularRed.copyWith(
              fontFamily: DrivenFonts.sfProDisplayFontFamily),
          bodyMedium: f14RegularBlackSfPro,
          bodyLarge: f16RegularBlackSfPro,
        ),
        inputDecorationTheme: inputDecorationTheme,
        dividerColor: DrivenColors.lightGrey,
        checkboxTheme: DrivenCheckboxTheme.theme,
        unselectedWidgetColor: DrivenColors.grey600,
        iconTheme: const IconThemeData(color: DrivenColors.cpPrimary),
      );
}
