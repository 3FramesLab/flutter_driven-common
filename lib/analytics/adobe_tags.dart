class AdobeTags {
  static final AdobeTags _singleton = AdobeTags._internal();
  factory AdobeTags() => _singleton;
  AdobeTags._internal();

  List<String> _adobeTags = [];

  void setAdobeTags(List<String> adobeTags) {
    _adobeTags = adobeTags;
  }

  bool isAdobeTagEnabled(String adobeCustomTag) {
    return _adobeTags.contains(adobeCustomTag);
  }
}
