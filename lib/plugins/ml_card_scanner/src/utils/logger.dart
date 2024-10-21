part of '../../ml_card_scanner.dart';

class Logger {
  static void log(String tag, String message) {
    if (kDebugMode) {
      print('$tag: $message');
    }
  }
}
