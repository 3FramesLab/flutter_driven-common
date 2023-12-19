part of driven_components_module;

class RegionInput extends StatelessWidget {
  final RxString formField;
  final String label;
  final String hintText;
  final double height;
  final RegionList options;
  final String validationMessage;
  final int maxLength;

  const RegionInput({
    required this.formField,
    required this.label,
    required this.hintText,
    required this.options,
    required this.validationMessage,
    this.height = 105,
    this.maxLength = 30,
    super.key,
  });

  void handleClear(String value) {
    if (options.where((val) => val.name == value).isEmpty) {
      formField('');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AutoCompleteInput<NameIdObject>(
        hintText: hintText,
        label: label,
        height: height,
        options: options,
        onSelected: (selection) {
          formField(selection.id);
        },
        onClear: handleClear,
        validationField: formField(),
        validationMessage: validationMessage,
        initialValue: options.nameFromId(formField()),
        maxLength: maxLength,
      ),
    );
  }
}
