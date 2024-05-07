// part of common_module;

import 'package:driven_common/driven_common_resources_module.dart';

class Validation {
  static const required = 'Required';
  static const mustBeNumber = 'Must be a valid number';
  static const mustBeDate = 'Must be a valid date';
  static const pinsMustMatch = 'PINs must match';
  static const defaultFieldsMustMatch = 'Fields must match';
  static const mustBeValidEmail = 'Must be valid email';
  static const mustBeValidMobile = 'Must be valid mobile number';
  static const mustMatch = 'must match';
  static const onlyLettersNumbersSpaces =
      'Only letters, numbers and spaces are allowed';
  static const mustEqualDelete = 'Must equal Delete';
  static const mustSelectState = 'Must select State';
  static const mustSelectProvince = 'Must select Province';
  static const mustSelectCountry = 'Must select Country';
  static const specialCharsNotAllowed = 'Special characters are not allowed';
  static const requiredAndMustNotStartWithZero =
      'Required, Must not start with a zero';
  static const specialCharsAndNumbersNotAllowed =
      'Special characters,spaces and numbers are not allowed';
  static const specialCharsAndNumbersNotAllowed2 =
      'Special characters and numbers are not allowed';
  // admin module validation messages.
  static const spacesNotAllowed = 'Spaces not allowed';
  static const userNameRequired = 'Should not be empty';
  static const enterValidEmail = 'Enter valid email';
  static const passwordMustBeLength = 'Must be at least 12 characters';
  static const enterValidAnswer = 'Enter a valid answer';
  static const mustMeetPasswordFormatRules = 'Must meet all format rules';
  static const passwordsMustMatch = 'Passwords must match';
  static const emailMustMatch = 'Email must match';
  static const userNameNotRecognized = 'User Name not recognized';
  static const securityAnswerRequired = 'Security Answer required';
  static const enterValidPhoneNumber = 'Enter a valid 10-digit phone number';
  static const notValidCardNumber = 'This is not a valid card number';
  static const alreadyInUse = 'already in use';

  static String mustBeNDigits(int n) {
    return 'Must be $n digits';
  }

  static String atLeastNCharacters(int n) {
    return 'Must be at least $n characters';
  }

  static String greaterThan(int n) {
    return 'Must be greater than $n';
  }

  static String mustBeNOrGreater(int n) {
    return 'Must be $n or greater';
  }

  static String mustBeNOrLess(int n) {
    return 'Must be $n or less';
  }

  static String mustBeBetweenMinAndMax(int min, int max) {
    return 'Must be between $min and $max';
  }

  static String mustBeN(int n) {
    return 'Must be $n';
  }

  static String fieldsMustMatch(String? fieldName) {
    return (fieldName == null || fieldName.isEmpty)
        ? defaultFieldsMustMatch
        : '$fieldName $mustMatch';
  }

  static String fieldAlreadyInUse(String? fieldName) {
    return (fieldName == null || fieldName.isEmpty)
        ? alreadyInUse.capitalizeFirstLetter()
        : '$fieldName $alreadyInUse';
  }
}
