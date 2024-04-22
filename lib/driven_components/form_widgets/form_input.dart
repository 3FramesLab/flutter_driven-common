// part of driven_components_module;

// class FormInput extends StatelessWidget {
//   final void Function(String?)? onChanged;
//   final String? Function(String?)? validator;
//   final String titleText;
//   final String placeholderText;
//   final TextInputType? keyboardType;
//   final bool obscureText;
//   final int? maxLength;
//   late final List<TextInputFormatter> inputFormatters;
//   final Widget? prefixIcon;
//   final BoxConstraints? prefixIconConstraints;
//   final Widget? suffixIcon;
//   final Widget? rightSlot;
//   final bool showCharacterCount;
//   final double height;
//   final int? errorMaxLines;
//   final String? initialValue;
//   final TextCapitalization textCapitalization;
//   final AutovalidateMode autoValidateMode;
//   final bool? enabled;
//   final String creditCheckInfoText;
//   final bool isPasswordWithNewRule;

//   FormInput({
//     required this.titleText,
//     required this.placeholderText,
//     this.keyboardType,
//     this.onChanged,
//     this.validator,
//     this.maxLength,
//     List<TextInputFormatter>? inputFormatters,
//     this.prefixIcon,
//     this.prefixIconConstraints,
//     this.suffixIcon,
//     this.obscureText = false,
//     this.rightSlot,
//     this.showCharacterCount = false,
//     this.height = 116,
//     this.errorMaxLines,
//     this.initialValue,
//     this.textCapitalization = TextCapitalization.none,
//     this.autoValidateMode = AutovalidateMode.onUserInteraction,
//     this.enabled = true,
//     this.creditCheckInfoText = '',
//     this.isPasswordWithNewRule = false,
//     Key? key,
//   }) : super(key: key) {
//     this.inputFormatters = inputFormatters ?? [];
//   }

//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: height,
//       child: Column(
//         children: [
//           if (isPasswordWithNewRule)
//             _passwordTextWithRulesIconRow()
//           else
//             _label(),
//           const VerticalSpacer(size: 10),
//           _textFormField(),
//           if (creditCheckInfoText.isNotEmpty) _creditCheckInfoTextLabel(),
//         ],
//       ),
//     );
//   }

//   Widget _label() {
//     return Semantics(
//       container: true,
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           Text(titleText, style: f14SemiboldGrey),
//           rightSlot ?? const SizedBox.shrink(),
//         ],
//       ),
//     );
//   }

//   Row _passwordTextWithRulesIconRow() {
//     final ScrollController scrollController = ScrollController();
//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       crossAxisAlignment: CrossAxisAlignment.end,
//       children: [
//         const LabelText(DrivenConstants.password),
//         // TODO(siva): Need to cross check
//         // PasswordRulesIcon(
//         //   scrollController: scrollController,
//         //   animateOffset: 320,
//         // )
//       ],
//     );
//   }

//   Widget _creditCheckInfoTextLabel() {
//     return CreditCheckInfoText(creditCheckInfoText);
//   }

//   Widget _textFormField() {
//     return Semantics(
//       container: true,
//       textField: true,
//       child: DrivenTextFormField(
//         inputFormatters: inputFormatters + _universalFormatters(),
//         onChanged: onChanged,
//         validator: validator,
//         autovalidateMode: autoValidateMode,
//         maxLength: maxLength,
//         keyboardType: keyboardType,
//         decoration: _inputDecoration(),
//         style: const TextStyle(fontSize: 14),
//         obscureText: obscureText,
//         initialValue: initialValue,
//         textCapitalization: textCapitalization,
//         enabled: enabled,
//       ),
//     );
//   }

//   InputDecoration _inputDecoration() {
//     return InputDecoration(
//       counterText: showCharacterCount ? null : '',
//       hintText: placeholderText,
//       prefixIcon: prefixIcon,
//       prefixIconConstraints: prefixIconConstraints,
//       suffixIcon: suffixIcon,
//       errorMaxLines: errorMaxLines,
//     );
//   }

//   List<TextInputFormatter> _universalFormatters() {
//     return [noLeadingSpacesFilter];
//   }
// }
