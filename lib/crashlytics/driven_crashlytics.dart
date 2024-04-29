import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/foundation.dart';

class DrivenCrashlytics {
  static FirebaseCrashlytics? _crashlytics;

  static DrivenCrashlytics init() {
    _crashlytics = FirebaseCrashlytics.instance;
    logFatalErrors();
    return DrivenCrashlytics();
  }

  void logEvent(String text) => _crashlytics?.log(text);

  void setCustomKey(String key, String value) {
    _crashlytics?.setCustomKey(key, value);
  }

  static void logFatalErrors() {
    recordNonAsyncError();
    recordAsyncError();
  }

  static void recordAsyncError() {
    PlatformDispatcher.instance.onError = (error, stack) {
      _crashlytics?.recordError(error, stack, fatal: true);
      return true;
    };
  }

  static void recordNonAsyncError() {
    FlutterError.onError = (errorDetails) {
      _crashlytics?.recordFlutterFatalError(errorDetails);
    };
  }

  void logNonFatalError({
    required String name,
    required String value,
    String reason = '',
  }) {
    _crashlytics?.recordError(
      '$name: $value\n',
      StackTrace.current,
      reason: 'non-fatal error $reason',
    );
  }
}
