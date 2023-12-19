Future<T> safeLaunchAsync<T>(
  String name, {
  required Future<T> Function() tryAction,
  Future<T> Function()? catchAction,
}) async {
  try {
    return await tryAction();
  } catch (exception) {
    // Globals.dynatrace.logError(
    //   name: 'Safe Launch Error - $name',
    //   value: exception.toString(),
    // );
    return catchAction != null ? catchAction() : Future.value();
  }
}

T? safeLaunch<T>(
  String name, {
  required T? Function() tryAction,
  T? Function()? catchAction,
}) {
  try {
    return tryAction();
  } catch (exception) {
    // Globals.dynatrace.logError(
    //   name: 'Safe Launch Error - $name',
    //   value: exception.toString(),
    // );
    return catchAction != null ? catchAction() : null;
  }
}

T safeInstance<T>(
  String name, {
  required Function() tryAction,
  Function()? catchAction,
}) {
  try {
    return tryAction();
  } catch (exception) {
    // Globals.dynatrace.logError(
    //   name: 'Safe Instance Error - $name',
    //   value: exception.toString(),
    // );
    return catchAction != null ? catchAction() : null;
  }
}
