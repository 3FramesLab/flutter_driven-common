part of extensions_module;

@immutable
class Region extends NameIdObject {
  const Region({
    required String name,
    required String id,
  }) : super(name: name, id: id);

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) {
      return false;
    }
    return other is Region && other.name == name && other.id == id;
  }

  @override
  int get hashCode => Object.hash(id, name);
}
