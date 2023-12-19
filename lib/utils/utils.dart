part of utils_module;

class Utils {
  static String base64Encode(String plainText) =>
      base64.encode(utf8.encode(plainText));

  static String base64Decode(String encodedText) =>
      utf8.decode(base64.decode(encodedText));
}
