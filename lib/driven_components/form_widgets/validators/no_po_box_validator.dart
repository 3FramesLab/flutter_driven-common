part of driven_components_module;

class NoPoBoxValidator extends ExcludePatternValidator {
  NoPoBoxValidator()
      : super(
          RegExp(
            r'(P\.O\.)|(PO\sBOX)',
            caseSensitive: false,
          ),
          'No P.O. Box',
        );
}
