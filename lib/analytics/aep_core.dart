import 'dart:async';

// Abstract class with methods we are using from ACP core for Mocking.
abstract class AEPCore {
  Future<void> trackAction(
    Map<String, Object>? data,
  );

  Future<void> trackPage(
    Map<String, Object>? data,
  );
}
