part of styles_module;

class CustomIcons {
  static const _kFontFam = DrivenFonts.customIcons;
  static const _materialFontFamily = 'MaterialIcons';

  static const IconData home = IconData(0xe800, fontFamily: _kFontFam);
  static const IconData wallet = IconData(0xe804, fontFamily: _kFontFam);
  static const IconData transfer = IconData(0xe803, fontFamily: _kFontFam);
  static const IconData trash = IconData(0xe802, fontFamily: _kFontFam);
  static const IconData activity =
      IconData(0xe534, fontFamily: _materialFontFamily);
}
