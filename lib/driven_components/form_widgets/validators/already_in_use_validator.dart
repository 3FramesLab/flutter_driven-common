import 'package:driven_common/common/validation.dart';
import 'package:driven_common/driven_components/driven_components_module.dart';

class AlreadyInUseValidator extends Validator {
  final String fieldName;
  final List<String> existingValues;

  AlreadyInUseValidator(this.fieldName, this.existingValues);

  @override
  bool isValid(String? value) {
    return value != null &&
        !existingValues
            .map((e) => e.toLowerCase())
            .contains(value.toLowerCase());
  }

  @override
  String get failMessage => Validation.fieldAlreadyInUse(fieldName);
}
