part of driven_components_module;

String formatEIN(String str) {
  return str.replaceAllMapped(
    RegExp(r'(\d{2})(\d{7})'),
    (m) => '${m[1]}-${m[2]}',
  );
}

String formatPhone(String str) {
  return str.replaceAllMapped(
    RegExp(r'(\d{3})(\d{3})(\d+)'),
    (m) => '(${m[1]}) ${m[2]}-${m[3]}',
  );
}

String formatSSN(String str) {
  return str.replaceAllMapped(
    RegExp(r'(\d{3})(\d{2})(\d{4})'),
    (m) => '${m[1]}-${m[2]}-${m[3]}',
  );
}

String formatHiddenSSN(String str) {
  return str.replaceAllMapped(
    RegExp(r'(\d{3})(\d{2})(\d{4})'),
    (m) => '*** ** ${m[3]}',
  );
}

String formatHiddenEIN(String str) {
  return str.replaceAllMapped(
    RegExp(r'(\d{5})(\d{4})'),
    (m) => '** ***${m[2]}',
  );
}

String formatHiddenNationIdentificationNumber(String str) {
  return str.replaceAll(
    RegExp('.(?=.{4})'),
    '*',
  );
}
