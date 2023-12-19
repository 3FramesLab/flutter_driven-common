import 'package:dynatrace_flutter_plugin/dynatrace_flutter_plugin.dart';

class DrivenDynatrace {
  static late Dynatrace _dynatrace;

  static DrivenDynatrace init() {
    _dynatrace = Dynatrace();

    return DrivenDynatrace();
  }

  Future<void> startWithoutWidget() async {
    await _dynatrace.startWithoutWidget();
  }

  void tagUser(String? username) {
    _dynatrace.identifyUser(username);

    tagEvent('User Logged In');
  }

  void tagEvent(String eventName) {
    final tagEvent = _dynatrace.enterAction(eventName);
    tagEvent.reportEvent(eventName);
    tagEvent.leaveAction();
  }

  void logError({
    required String name,
    required String value,
    String reason = '',
    String? stackTrace,
  }) {
    final trace = stackTrace ?? StackTrace.current.toString();

    _dynatrace.reportErrorStacktrace(name, value, reason, trace);
  }
}
