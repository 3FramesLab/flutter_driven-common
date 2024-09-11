part of utils_module;

class Utils {
  static String base64Encode(String plainText) =>
      base64.encode(utf8.encode(plainText));

  static String base64Decode(String encodedText) =>
      utf8.decode(base64.decode(encodedText));

  static double getCameraCutoutHeight(
      BuildContext context, CardOrientation cardOrientation) {
    final size = MediaQuery.sizeOf(context);
    return cardOrientation == CardOrientation.portrait
        ? (size.width * 0.75) * 1.6
        : (size.width * 0.95) / 1.8;
  }

  static double getCameraCutoutWidth(
      BuildContext context, CardOrientation cardOrientation) {
    final size = MediaQuery.sizeOf(context);
    return cardOrientation == CardOrientation.portrait
        ? size.width * 0.75
        : size.width * 0.8;
  }
}
