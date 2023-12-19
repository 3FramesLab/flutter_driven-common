part of driven_components_module;

FilteringTextInputFormatter get alphaNumericInputFilter =>
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9]'));

FilteringTextInputFormatter get alphaNumericSpaceInputFilter =>
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9 ]'));

FilteringTextInputFormatter get alphaNumericUnderscoreInputFilter =>
    FilteringTextInputFormatter.allow(RegExp('[a-zA-Z0-9_]'));

FilteringTextInputFormatter get noLeadingSpacesFilter =>
    FilteringTextInputFormatter.deny(RegExp(r'^[ \s]+|$'));

FilteringTextInputFormatter get numericInputFilter =>
    FilteringTextInputFormatter.allow(RegExp('[0-9]'));

FilteringTextInputFormatter get nonZeroStartFilter =>
    FilteringTextInputFormatter.deny(RegExp('^0+'));
