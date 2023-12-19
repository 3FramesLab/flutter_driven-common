part of extensions_module;

class RegionList extends ListBase<Region> {
  late final List<Region> innerList;

  RegionList(Iterable<Region> items) {
    innerList = List<Region>.unmodifiable(items);
  }

  @override
  int get length => innerList.length;

  @override
  set length(int length) {
    innerList.length = length;
  }

  @override
  void operator []=(int index, Region value) {
    innerList[index] = value;
  }

  @override
  Region operator [](int index) => innerList[index];

  String nameFromId(String id) {
    return firstWhere(
      (region) => region.id == id,
      orElse: () => const Region(name: '', id: ''),
    ).name;
  }
}
