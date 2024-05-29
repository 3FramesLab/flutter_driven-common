part of utils_module;

// ignore: avoid_positional_boolean_parameters
String boolToYorN(bool value) => value ? 'Y' : 'N';

bool yOrNToBool(String yOrN) => yOrN == 'Y';
