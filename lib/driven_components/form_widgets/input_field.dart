part of driven_components_module;

class InputField extends StatelessWidget {
  final String titleText;
  final String placeholderText;
  final TextInputType keyboardType;
  final void Function(String)? onChange;

  const InputField({
    required this.titleText,
    required this.placeholderText,
    required this.keyboardType,
    this.onChange,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 19, 0, 10),
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              titleText,
              style: f14SemiboldBlack2,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: TextField(
              onChanged: onChange,
              keyboardType: keyboardType,
              decoration: InputDecoration(
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: DrivenColors.lightGrey,
                  ),
                ),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                    color: DrivenColors.lightGrey,
                  ),
                ),
                border: const OutlineInputBorder(),
                hintText: placeholderText,
                labelStyle: const TextStyle(
                  fontSize: 14,
                  color: DrivenColors.lightGrey,
                ),
              ),
              style: const TextStyle(
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
