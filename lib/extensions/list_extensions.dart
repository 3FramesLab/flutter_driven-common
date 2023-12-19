part of extensions_module;

extension ListExtensions<T> on List<T> {
  List<String> toStringList() =>
      List<String>.from(map((p) => p.toString())).toList();
}
